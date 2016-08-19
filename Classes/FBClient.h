//
//  FaceBook.h
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBConnect.h"

@interface FBClient : NSObject <FBSessionDelegate, FBDialogDelegate, FBRequestDelegate, UIWebViewDelegate>
{
    Facebook *facebook;
    NSString *appId;
    NSString *appAcessToken;
    // NSDictionary *userInfo;
    NSString *userId;
    NSString *startGameDate;
    
    NSMutableDictionary *achievementCache;
    NSMutableDictionary *achievements2send;
    void (^callback)(void);
    
    FBRequest *userInfoRequest;
    FBRequest *sendAchievementsRequest;
}

@property (nonatomic, retain) Facebook *facebook;

+(FBClient*) sharedFBClient;
-(void) postWall:(NSString*) message;
-(void) got2facebookApp;
-(void) logout;
-(void) validateSession;
-(void) saveAchievementsCache;
-(void) gameStart;

-(BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent;
-(void) reportScore: (int64_t) score;
-(void) reportPlay;

- (void)dialogDidCancel:(NSURL *)url;
- (void)dialogDidComplete:(FBDialog *)dialog;

- (void)fbDidNotLogin:(BOOL)cancelled;
@end
