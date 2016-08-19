//
//  RootViewController.h
//  iNigma
//
//  Created by Francisco Padilla on 3/8/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "ASTStoreViewController.h"

@interface RootViewController : UIViewController <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, GKFriendRequestComposeViewControllerDelegate, ASTStoreViewControllerDelegate>
{

}

- (void) showStore;

@end
