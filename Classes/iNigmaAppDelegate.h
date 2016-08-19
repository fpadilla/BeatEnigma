//
//  iNigmaAppDelegate.h
//  iNigma
//
//  Created by Francisco Padilla on 3/8/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "TracksLayer.h"

#import "ChartboostManager.h"

@class RootViewController;

@interface iNigmaAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    ChartboostManager *chartBoostMgr;
    NSString *notificationLink;

}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic) RootViewController *viewController;


@end
