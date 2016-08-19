//
//  GameCenter.m
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameCenter.h"
#import <CommonCrypto/CommonDigest.h>

@implementation GameCenter

static GameCenter* sharedGameCenter;

@synthesize localPlayerAuthenticated;

-(BOOL) isGameCenterAPIAvailable
{
    // Check for presence of GKLocalPlayer class.
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    // The device must be running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    return (localPlayerClassAvailable && osVersionSupported);
}

- (id)init
{    
    NSAssert(sharedGameCenter == nil, @"Duplicate Instance of GameCenter Class");

    self = [super init];
    if (self) {
        isGMEnabled = [self isGameCenterAPIAvailable];
        unreportedObjects = [[[[NSMutableArray alloc] init] autorelease] retain];
        localPlayerAuthenticated = NO;
    }
    
    return self;
}

-(void) dealloc
{
    if ( unreportedObjects != nil ) {
        [unreportedObjects release];
    }
}

+(GameCenter*) sharedGameCenter
{
    if (sharedGameCenter == nil) {
        sharedGameCenter = [[[GameCenter alloc] init] retain];
    }
    return sharedGameCenter;
}

- (void) authenticateLocalPlayer
{
    if ( ! isGMEnabled ) {
        return;
    }
    
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer authenticateWithCompletionHandler:^(NSError *error) {
        if (localPlayer.isAuthenticated)
        {
            // #Log(@"Player authenticated");
            localPlayerAuthenticated = true;
            unreportedObjects = [[[[NSMutableArray alloc] init ] autorelease] retain];
            if ( playerID != nil && [playerID compare:localPlayer.playerID ] ){                
                // load unreported objets for this new player 
            } else {
                // send unreported objects for player
            }
            playerID = localPlayer.playerID;
            [self loadAchievementsCache];

            [self unArchiveUnreportedObjects];
            [self sendUnreportedObjects];
        } else {
            localPlayerAuthenticated = NO;
        }
    }];
}

-(void) loadAchievementsCache
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    achievementCache = [[NSMutableDictionary alloc] initWithDictionary:
                        [defaults objectForKey:[@"GCAchievementsCache-" stringByAppendingString:playerID] ]  ];
    if ( achievementCache == nil ){
        achievementCache = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    [achievementCache retain];
}

-(void) saveAchievementsCache
{
    if ( localPlayerAuthenticated ) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:achievementCache forKey:[@"GCAchievementsCache-" stringByAppendingString:playerID] ];
        [defaults synchronize];
    }
}

- (void) showLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil)
    {
        UIViewController *viewController = [[[UIApplication sharedApplication] delegate] viewController];
        leaderboardController.leaderboardDelegate = viewController;
        [viewController presentModalViewController: leaderboardController animated: YES];
    }
}

- (void) showAchievements
{
    GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
    if (achievements != nil)
    {
        UIViewController *viewController = [[[UIApplication sharedApplication] delegate] viewController];
        achievements.achievementDelegate = viewController;
        [viewController presentModalViewController: achievements animated: YES];
    }
    [achievements release];
}

- (void) showInviteFriends: (NSArray*) identifiers
{
    // The device must be running iOS 4.2 or later.
    NSString *reqSysVer = @"4.2";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    if (!osVersionSupported) {
        // require 
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iOS 4.2 Required" message:@"Friend Request is available on iOS 4.2 or greater" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    UIViewController *rootController = [[[UIApplication sharedApplication] delegate] viewController];
    
    GKFriendRequestComposeViewController *friendRequestViewController = [[GKFriendRequestComposeViewController alloc] init];
    friendRequestViewController.composeViewDelegate = rootController;
    if (identifiers)
    {
        [friendRequestViewController addRecipientsWithPlayerIDs: identifiers];
    }
    [rootController presentModalViewController: friendRequestViewController animated: YES];
    [friendRequestViewController release];
}

- (void) reportScore: (int64_t) score forCategory: (NSString*) category
{
    if ( ! isGMEnabled || !localPlayerAuthenticated) {
        return;
    }
    
/*#ifdef LITE_VERSION
    category = [category stringByAppendingString:@"_lite"];
#endif*/
    
    GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
    scoreReporter.value = score;

    // Report this score to the server. The value must be set, and date may be changed.
    // Possible reasons for error:
    // 1. Value not set
    // 2. Local player not authenticated
    // 3. Communications problem
    [unreportedObjects addObject:scoreReporter]; // add reported Score 

/*    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        if ( error != nil ) {
            // Log(@"GameCenter reportScore Error %@:%i:%@ sending score %i category %@",[error domain], [error code], [error localizedDescription], [scoreReporter value], [scoreReporter  category]);
            [unreportedObjects addObject:scoreReporter]; // add reported Score 
        } else {
        }
    }];*/
    
}

- (BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent
{
    if ( ! isGMEnabled || !localPlayerAuthenticated) {
        return NO;
    }
    
/*#ifdef LITE_VERSION
    identifier = [identifier stringByAppendingString:@"_lite"];
#endif*/

    if ( [[achievementCache objectForKey:identifier] floatValue] < percent ){
        GKAchievement *achievement = [[[GKAchievement alloc] initWithIdentifier:identifier] autorelease];
        achievement.percentComplete = percent;
        [unreportedObjects addObject:achievement];
        // Log(@"GameCenter add achievement : %i objects", [unreportedObjects count]); 
        return YES;
    } else {
        /* Log(@"GameCenter previous achievement : %@ with value %f ", identifier, 
              [[achievementCache objectForKey:identifier] floatValue]); */
        return NO;
    }
}

-(void) sendUnreportedObjects
{    
    int t = [unreportedObjects count];
    for (int i = 0; i< t; i++) {
        id obj = [unreportedObjects objectAtIndex:i];
        if ( [obj isKindOfClass:[GKAchievement class]] ) {  // ACHIEVEMENTS
            [obj reportAchievementWithCompletionHandler:^(NSError *error)
             {
                 if ( error == nil )
                 {
                     [unreportedObjects removeObject:obj];
                     [achievementCache setObject:[NSNumber numberWithFloat:[obj percentComplete] ] forKey:[obj identifier] ];

                      //NSLog(@"GameCenter sendUnreportedObjects Achievement %@ sent", obj);
                 } else if (error != nil) {
                    // NSLog(@"GameCenter sendUnreportedObjects Error %@:%i:%@ sending achievement %i percent %i", 
                    //       [error domain], [error code], [error localizedDescription],[obj identifier], [obj  percentComplete]); 
                 }
             }];
        } else if ( [obj isKindOfClass:[GKScore class]] ){  // SCORE
            [obj reportScoreWithCompletionHandler:^(NSError *error)
             {
                 if (error == nil )
                 {
                     [unreportedObjects removeObject:obj];
                     //NSLog(@"GameCenter sendUnreportedObjects Score %@ sent", obj);
                 } else {
                     //NSLog(@"GameCenter sendUnreportedObjects Error %@:%i:%@ sending score %i category %@",[error domain], [error code], [error localizedDescription], [obj value], [obj  category]);
                 }
             }];
        }
    }
    // Log(@"GameCenter sendUnreportedObjects %i objects sent", [unreportedObjects count]);
}

-(void) archiveUnreportedObjects
{
    if ( unreportedObjects != nil && localPlayerAuthenticated) {
        [NSKeyedArchiver archiveRootObject:unreportedObjects toFile:[self dataFilePath]];
        NSMutableData *data = [NSMutableData dataWithContentsOfFile:[self dataFilePath]];
        [data appendData:[@"79683976" dataUsingEncoding:NSUTF8StringEncoding]];
        
        GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
        
        NSString *md5String = [self unserialize: data];
        NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];        
        [defaults setObject: md5String forKey:localPlayer.playerID ];
        [defaults synchronize];
        // Log(@"GameCenter archiveUnreportedObjects %i objects", [unreportedObjects count]);
    }
}


-(void) unArchiveUnreportedObjects
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];

    NSMutableData *data = [NSMutableData dataWithContentsOfFile:[self dataFilePath]];
    [data appendData:[@"79683976" dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *md5String = [self unserialize: data];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedMD5 = [defaults objectForKey: localPlayer.playerID ];
    if ( [md5String isEqualToString:savedMD5 ] && data.length){
        unreportedObjects = [[NSKeyedUnarchiver unarchiveObjectWithFile:[self dataFilePath]] retain];  
        // Log(@"GameCenter UNarchiveUnreportedObjects %i objects", [unreportedObjects count]);
    } else if ( data.length > 0 ) {
        // Log(@"Bad Boy ! What're you ganna do ?");
    }    
}

- (NSString *)dataFilePath 
{ 
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0];
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    NSString *fileName = [@"pl" stringByAppendingString:[localPlayer playerID]];
	return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (NSString*)unserialize:(NSData*) data
{
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(data.bytes, data.length, md5Buffer);
    
    // Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) 
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

@end
