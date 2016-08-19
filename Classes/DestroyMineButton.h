//
//  DestroyMineButton.h
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "cocos2d.h"
#import "UserTracking.h"

@interface DestroyMineButton : CCMenuItemSprite
{
    int mineCount;
    CCSprite *radar;
    CCLabelBMFont *mineLabel;
}

-(id) initDestroyMineButton;
-(void) destroyMines;

@end
