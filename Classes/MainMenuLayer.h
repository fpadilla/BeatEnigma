//
//  MainMenuLayer.h
//  iNigma
//
//  Created by Francisco Padilla on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "UserTracking.h"
#import <MessageUI/MessageUI.h> 
#import <MessageUI/MFMailComposeViewController.h>

@interface MainMenuLayer : CCLayer<MFMailComposeViewControllerDelegate, UIActionSheetDelegate> {
    CCMenuItemSprite *gameCenter;
    CCMenuItemSprite *leaderBoard;
    CCMenuItemSprite *achievements;
    CCMenuItemSprite *requestFriends;
    BOOL isGameCenterMenuHidden;
    UIViewController *rootViewController;
    CCSprite *chooseModeBkg;
    CCLabelBMFont *coinsLabel;
}

+(id)scene;

-(id)init;
-(void)play:(id)sender;
-(void)help:(id)sender;

-(void) gameCenter:(id)sender;
-(void) leaderBoard:(id)sender;
-(void) achievements:(id)sender;
-(void) requestFriends:(id)sender;
-(void) showGameCenterMenu;
-(void) hideGameCenterMenu;

- (void)showMailComposerFor:(NSArray*)recipients  subjet:(NSString*) subject body:(NSString*)body;


@end
