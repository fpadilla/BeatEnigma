//
//  AddTimeButton.h
//  iNigma
//
//  Created by Francisco Padilla on 12/3/12.
//
//

#import "cocos2d.h"

#define TIME_VALUE 10
#define TIME_COUNT 5

@interface AddTimeButton : CCMenuItemSprite
{
    int multiplier;
}

-(id) initAddTimeButton;
-(void) addTime;

@end
