//
//  AddTimeButton.m
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "AddTimeButton.h"
#import "UserTracking.h"
#import "GameMechanics.h"

@implementation AddTimeButton

-(id) initAddTimeButton
{
    if (self = [self initFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"addTime-normal.png"]
                           selectedSprite:[CCSprite spriteWithSpriteFrameName:@"addTime-selected.png"]
                           disabledSprite:[CCSprite spriteWithSpriteFrameName:@"addTime-disabled.png"]
                                   target:self
                                 selector:@selector(addTime)] ) {
        if (![[UserTracking sharedUserTracking] coinCount]) {
            self.isEnabled = NO;
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(coinCountChanged:) name:@"CoinCountChanged" object:nil];
        multiplier = 1;
    }
    return self;
}

-(void) addTime
{
    int coins = TIME_COUNT*TIME_VALUE*multiplier;
    if ([[UserTracking sharedUserTracking] addCoins:-coins withSubject:@"ADD_TIME"]) {
        GameMechanics *game = [GameMechanics sharedGame];
        if (game.mode == TIMELESS) {
            [game addTurns:5];
            [game.machine.frontLayer showPhaseLabel:@"+5 Turns!" delay:2.0];
        } else {
            [game increaseElapsedTime:5.0];
            [game.machine.frontLayer showPhaseLabel:@"+5 secs!" delay:1.0];
        }

        [game.machine.frontLayer showParticules:@"addTimeParticles.plist" atLocation:self.position variance:ccp(5,5)];
        [game.machine.frontLayer showPointLabel:[@"-" stringByAppendingFormat:@"%i coins",coins]
                                     atLocation:ccp(self.position.x+50, self.position.y+30)
                                          color:ccYELLOW];
        multiplier++;
    }
}

-(void) coinCountChanged:(NSNotification *)notification
{
    if ( [[notification.userInfo valueForKey:@"newCoinCount"] integerValue] > TIME_COUNT*TIME_VALUE*multiplier ) {
        self.isEnabled = YES;
    } else{
        self.isEnabled = NO;
    }
}

@end
