//
//  ButtonLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "CCMenu.h"
#import "AddTimeButton.h"
#import "DestroyMineButton.h"

@interface ButtonLayer : CCMenu
{
    DestroyMineButton *destroyMineButton;
    AddTimeButton *addTimeButton;
    CCMenuItemSprite *pauseButton;
}

-(id) initButtonLayer;

@end
