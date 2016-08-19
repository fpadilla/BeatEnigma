//
//  GameCenter.h
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface GameCenter : NSObject
{
    BOOL isGMEnabled;
    NSMutableArray *unreportedObjects;
    NSMutableDictionary *achievementCache;

    BOOL localPlayerAuthenticated;
    NSString *playerID;
}

@property(readonly) BOOL localPlayerAuthenticated;

+(GameCenter*) sharedGameCenter;
-(BOOL) isGameCenterAPIAvailable;
-(void) authenticateLocalPlayer;
-(void) showLeaderboard;
-(void) showAchievements;
-(void) reportScore:(int64_t) score forCategory: (NSString*) category;
-(BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent;
- (void) showInviteFriends: (NSArray*) identifiers;
-(void) sendUnreportedObjects;
-(void) archiveUnreportedObjects;
-(void) unArchiveUnreportedObjects;
-(void) saveAchievementsCache;
@end
