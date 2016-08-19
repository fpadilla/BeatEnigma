//
//  DestroyMineButton.m
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "DestroyMineButton.h"
#import "GameMechanics.h"

@implementation DestroyMineButton

-(id) initDestroyMineButton
{
    if (self = [self initFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"destroyMines-normal.png"]
                           selectedSprite:nil
                           disabledSprite:nil
                                   target:self
                                 selector:@selector(destroyMines)] ) {

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coinCountChanged:) name:@"updateMineCount" object:nil];

        self.anchorPoint = ccp(0.5,0.5);
        
        radar = [CCSprite spriteWithSpriteFrameName:@"minesRadar-off.png"];
//        radar.position = ccp(self.contentSize.width/2,self.contentSize.height/2);
        [self addChild:radar];
        
        CCSprite *cursor = [CCSprite spriteWithSpriteFrameName:@"radarCursor.png"];
        cursor.anchorPoint = ccp(0.1,0.5);
        [cursor runAction:[CCRepeatForever actionWithAction:[CCRotateBy actionWithDuration:2.0 angle:360]]];
        [self addChild:cursor];

        self.normalImage.anchorPoint = ccp(0.5,0.5);
  //      self.normalImage.position = radar.position;

        mineLabel = [CCLabelBMFont labelWithString:@"" fntFile:@"Points Font.fnt"];
        mineLabel.scale = 0.65;
        mineLabel.anchorPoint = ccp(0.5,0.5);
        mineLabel.color = ccYELLOW;
        [self addChild:mineLabel];
        
        [self schedule:@selector(updateMineCount) interval:1/3.0];

    }
    return self;
}

-(void) updateMineCount
{
    GameMechanics *game = [GameMechanics sharedGame];
    mineCount = [game.tracksLayer countMines];
    int availableCoins = [[UserTracking sharedUserTracking] coinCount];
    if (mineCount) {
        if ([[UserTracking sharedUserTracking] hasPowerUp:@"com.startfruitlabs.beatenigma.destroyMines"] || availableCoins > TIME_COUNT*TIME_VALUE*mineCount
             ) {
            [radar setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"minesRadar-on.png"] ];
        } else {
            [radar setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"minesRadar-off.png"] ];
        }
        radar.visible = YES;
        mineLabel.string = [NSString stringWithFormat:@"%i", mineCount];
        mineLabel.visible = YES;
    } else {
        radar.visible = NO;
        mineLabel.visible = NO;
    }
}

-(void) destroyMines
{
    if (!mineCount)
        return;
    int coinValue = -TIME_COUNT*TIME_VALUE*mineCount;
    if ( [[UserTracking sharedUserTracking] hasPowerUp:@"com.startfruitlabs.beatenigma.destroyMines"] ||
            [[UserTracking sharedUserTracking] addCoins:coinValue withSubject:@"DESTROY_MINES"] ) {
        
        GameMechanics *game = [GameMechanics sharedGame];
        [game.tracksLayer jokerMines];
        
        if (![[UserTracking sharedUserTracking] hasPowerUp:@"com.startfruitlabs.beatenigma.destroyMines"]) {
            [game.machine.frontLayer showPhaseLabel:
             [NSString stringWithFormat:@"%i coins ", coinValue] delay:1.5];
        } else {
            [game.machine.frontLayer showPhaseLabel:
            [NSString stringWithFormat:@"%i destroyed ", mineCount] delay:1.5];

        }
        
    }
}

@end
