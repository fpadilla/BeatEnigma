//
//  FaceBook.m
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FBClient.h"
#import "cocos2d.h"
#import "GameConfig.h"
#import "GameFlow.h"

@implementation FBClient

@synthesize facebook;

static FBClient *sharedFBClient;

+(FBClient*) sharedFBClient
{
    if (sharedFBClient == nil) {
        sharedFBClient = [[[[FBClient alloc] init] autorelease] retain];
    }
    return sharedFBClient;
}

- (id)init
{
    NSAssert(sharedFBClient == nil,@"Duplicated FBClient singleton");
    
    self = [super init];
    if (self) {
        appId = @"238777919512854";
        self.facebook = [[Facebook alloc] initWithAppId:appId andDelegate:self];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"FBAccessTokenKey"] 
            && [defaults objectForKey:@"FBExpirationDateKey"]) {
            facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
            facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
            if ([facebook isSessionValid]) {
                // Log(@"Previous Facebook Session Loaded Sucessfully access_token=%@", facebook.accessToken);
                [self requestAppAcessToken];
                
                userId = [defaults objectForKey:@"FBUserId"];
                if( [defaults objectForKey:@"FBUserId"] != nil ){
                     [userId retain];
                    [self loadAchievementsCache];
                } else { // just in case 
                    [self requestUserInfo];
                }
            } else {
                // Log(@"Previous Facebook Session fail to load");
            }
        } else {
            // Log(@"No previous FaceBook token");
        }
        
        achievements2send = [[[[NSMutableDictionary alloc] init] autorelease] retain];
        /*achivementUrls = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                          @"", "1004",
                          @"", "1005",
                           nil];*/
    }
    return self;
}

-(void) validateSession
{
    if (![facebook isSessionValid]) {
        [[CCDirector sharedDirector] stopAnimation];
        NSArray *permissions = [[NSArray alloc] initWithObjects:
                                @"user_likes",
                                @"offline_access",
                                @"read_stream",
                                @"user_games_activity",
                                @"friends_games_activity",
                                @"publish_actions",
                                nil];
        [facebook authorize:permissions];
        [permissions release];
    }
}

-(void) postWall:(NSString*) message
{
    
    if (![facebook isSessionValid]) {
        callback = ^{
            [self postWall:message];
        };
        callback = [callback copy];
        [self validateSession];
        return;
    }
    
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   appId, @"app_id",
                                   @"http://www.beatenigma.com", @"link",
                                   @"http://www.beatenigma.com/fbApp/postIcon.png", @"picture",
                                   
                                   message, @"name",
                                   @"Beat Enigma. It’s a fun and addictive game for iPhone and iPod Touch.", @"caption",
                                   @"See Demo Video, ratings and comments in the App Store. Share your scores and achievements with your friends.", @"description",
                                   
                                   /* ,{'name': 'Learn More', 'link': 'http://www.beatenigma.com'} ] } */
                                    [@"{'name': 'Get Beat Enigma', 'link': 'http://www.beatenigma.com/appStore.html'} \
                                       " stringByReplacingOccurrencesOfString:@"'" withString:@"\"" ] ,  @"actions",
                                  
                                   @"postScore", @"ref",
                                   nil];
    [[CCDirector sharedDirector] stopAnimation];
    
    
    [facebook dialog:@"feed" andParams:params andDelegate:self];
    /*
     [facebook requestWithGraphPath:[NSString stringWithFormat:@"/me/feed", appId] 
     andParams:params 
     andHttpMethod:@"POST" 
     andDelegate:self]; */
}

#pragma mark FBSessionDelegate

- (void)fbDidLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    [self requestAppAcessToken];
    [self requestUserInfo];

    [[GameFlow sharedGameFlow] reportAchievementIdentifier:@"5000" percentComplete:100.0];

    [[CCDirector sharedDirector] startAnimation];
    // Log(@"Facebook token saved");
    
    
    if( callback ) {
        callback();
        callback = nil;
    }
}

- (void)fbDidNotLogin:(BOOL)cancelled {
    // Log(@"FBClient fbDidNotLogin ");
    
    if(!cancelled) {    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Network Issue"
                                                            message:@"The Internet connection appears to be offline."
                                                           delegate:self 
                                                  cancelButtonTitle:@"Ok" 
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    [[CCDirector sharedDirector] startAnimation];
}

- (void) fbDidLogout {
    // Remove saved authorization information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults removeObjectForKey:@"FBUserId"];
        [defaults synchronize];
    }
}

#pragma mark Score and Achievements

-(NSString*) getDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    // [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"Y-MM-dd HH:mm:ss"];
    NSDate *now = [NSDate date];
    now  = [ now dateByAddingTimeInterval:-60];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *dateString = [dateFormatter stringFromDate:now ];
    return dateString;
}

-(void) gameStart
{
    startGameDate = [[self getDateString] retain];
}

-(void) loadAchievementsCache
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    achievementCache = [defaults objectForKey:[@"FBAchievementsCache-" stringByAppendingString:userId] ];
    if ( achievementCache == nil ){
        achievementCache = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    [achievementCache retain];
}

-(void) saveAchievementsCache
{
    if ( [facebook isSessionValid] && achievementCache != nil &&[achievementCache count] > 0) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:achievementCache forKey:[@"FBAchievementsCache-" stringByAppendingString:userId] ];
        [defaults synchronize];
    }
}

-(void) reportScore: (int64_t) score;
{
    if (![facebook isSessionValid]) {
         return;
    }        
    
    [self sendAchievementsAndScore:score];
    /*NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                   [NSString stringWithFormat:@"%i", score ], @"score",
                                   appAcessToken, @"access_token",
                                   nil];
    
    NSString * fullURL = [@"https://graph.facebook.com/" stringByAppendingFormat:@"%@/scores", [userInfo objectForKey:@"id"]];
    FBRequest *_request = [[FBRequest getRequestWithParams:params
                                                httpMethod:@"POST"
                                                  delegate:self
                                                requestURL:fullURL] retain];
    [_request connect];*/
}

-(BOOL) reportAchievementIdentifier: (NSString*) identifier percentComplete: (float) percent
{
    if (![facebook isSessionValid]) {
        return NO;
    }  

    if ([achievements2send objectForKey:identifier] == 0 && percent == 100.0 && 
        [[achievementCache objectForKey:identifier] floatValue] < percent  ) {
        // Log(@"FBCLient reportAchievementIdentifier %@", identifier);
        [achievements2send setObject:[NSNumber numberWithFloat:100.0] forKey:identifier];
        return YES;
    } else {
        // Log(@"FBCLient reportAchievementIdentifier %@ in local cache", identifier);
        return NO;
    }
}

-(void) sendAchievementsAndScore:(int) score
{
    
    if ( ! [facebook isSessionValid] 
        // || achievements2send == nil
        // || ![achievements2send count]
        ) {
            return;
    }
    
    // 44f2f1ac3ab400c41da38e32fd9fa995
    NSString *playRequest = [ @"{ \
'method': 'POST', \
'relative_url': '/me/games.plays?', \
'body': 'game=http://beatenigma.com/index.htm&start_time=%@&end_time=%@' \
}" stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    playRequest = [NSString stringWithFormat:playRequest, startGameDate, [self getDateString] ];

    
    NSString *userInfoRequest = [ @"{ \
'method': 'GET', \
'name': 'userInfo', \
'relative_url': 'me' \
}" stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    
    NSString *scoreRequest = [ @"{ \
'method': 'POST', \
'relative_url': '{result=userInfo:$.id}/scores', \
'body': 'score=%i&access_token=%@' \
} " stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    scoreRequest = [NSString stringWithFormat:scoreRequest, score, appAcessToken];

    
    NSString *achievementTemplate = [ @"{ \
'method': 'POST', \
'relative_url': '{result=userInfo:$.id}/achievements', \
'body': 'access_token=%@&achievement=http://beatenigma.com/fbApp/achievements/%@.html' \
} " stringByReplacingOccurrencesOfString:@"'" withString:@"\""];
    
    NSString *achievements = @"";
    for (NSString *identifier in [achievements2send keyEnumerator]) 
    {
        NSString *item = [NSString stringWithFormat:achievementTemplate, appAcessToken, identifier ];
        if ([achievements isEqualToString:@""]) {
            achievements = item;
        } else {
            achievements = [achievements stringByAppendingFormat:@"\n ,%@", item];
        }
    }
    
    
    NSString *batch = [NSString stringWithFormat:@" %@ , %@, %@ ", playRequest, userInfoRequest, scoreRequest];
    if ( ! [achievements isEqualToString:@""] ) {
        batch = [NSString stringWithFormat:@"%@, %@", batch, achievements];
    }
    batch = [NSString stringWithFormat:@"[ %@ ]", batch];

    // Log(@"batch = %@", batch);
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                   batch, @"batch",
                                   appAcessToken, @"access_token",
                                   nil];
    
    sendAchievementsRequest = [facebook requestWithGraphPath:[NSString stringWithFormat:@""] 
                         andParams:params 
                     andHttpMethod:@"POST"
                       andDelegate:self];    
}

#pragma mark Request

-(void) requestUserInfo 
{    
    userInfoRequest = [facebook requestWithGraphPath:@"me" 
                                         andDelegate:self];
}

-(void) requestAppAcessToken
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                   appId, @"client_id",
                                   @"4a2fab3d2b5e31f39522645dbdaee1cf", @"client_secret",
                                   @"client_credentials", @"grant_type",
                                   nil];
    
    NSString * fullURL = @"https://graph.facebook.com//oauth/access_token";
    FBRequest *_request = [[FBRequest getRequestWithParams:params
                                                httpMethod:@"GET"
                                                  delegate:self
                                                requestURL:fullURL] retain];
    [_request connect];
}

#pragma mark FBRequestDelegate methods

- (void)request:(FBRequest *)request didLoad:(id)result
{
    // Log(@"FBClient request didLoad for request of type: %@", [request url] ); 
    NSString *url = [request url];
    
    if (request == sendAchievementsRequest && result != nil) {
        for (id obl in result) { // array
            if ([obl isKindOfClass:[NSDictionary class]]) {
                NSMutableDictionary * dict = obl;
                if ([[dict objectForKey:@"code"] intValue] != 200) {
                    // Log(@"FBClient request:didLoad Error %@", [dict objectForKey:@"body"]);
                }
            }
        }
        
        // test result of score request
        NSDictionary *scoreResp = (NSDictionary*)[result objectAtIndex:2];
        if ( [[scoreResp objectForKey:@"code"] intValue] == 200 ) {
            [achievementCache addEntriesFromDictionary:achievements2send];
            [achievements2send removeAllObjects]; 
        }
    }
    
    if ([ url rangeOfString:@"/oauth/access_token"].location != NSNotFound ) {
        NSString* responseString = [[NSString alloc] initWithData:result
                                                         encoding:NSUTF8StringEncoding];
        NSArray *comp = [responseString componentsSeparatedByString:@"="];
        appAcessToken = [[comp objectAtIndex:1] retain];
        // Log(@"FBCLient app_access_token = %@", appAcessToken); 
    }
    
    if ([ url hasSuffix:@"/me"] ) {
        userId = [[result objectForKey:@"id"] retain];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:userId forKey:@"FBUserId"];
        [defaults synchronize];
        [self loadAchievementsCache];
    }
}

- (void)request:(FBRequest *)request didFailWithError:(NSError *)error
{
#ifdef DEBUG
     NSLog(@"FBClient request for url %@ didFailWithError: %@", [request url], [error description]);
#endif
}

#pragma mark FBDialogDelegate methods

- (void)dialogDidCancel:(NSURL *)url 
{
    // Log(@"FBClient dialogDidCancel ");
    [[CCDirector sharedDirector] startAnimation];
}

- (void)dialogDidComplete:(FBDialog *)dialog 
{
    // Log(@"FBClient dialogDidComplete ");
    [[CCDirector sharedDirector] startAnimation];

}

- (void)dialog:(FBDialog*)dialog didFailWithError:(NSError*)error
{
    [[CCDirector sharedDirector] startAnimation];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Facebook Issue"
                                                        message:[error localizedDescription]
                                                       delegate:self 
                                              cancelButtonTitle:@"Ok" 
                                              otherButtonTitles:nil];
    [alertView show];
    if ([error domain]) {
  //      <#statements#>
    }
}

- (void) requestDialogButtonClicked 
{
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"invites you to check out cool stuff",  @"message",
                                   @"Check this out", @"notification_text",
                                   nil];  
    [facebook dialog:@"apprequests"
           andParams:params
         andDelegate:self];
}

#pragma mark other stuff

-(void) reportPlay
{
    if (![facebook isSessionValid]) {
        return;
        
    }
    
    // Log(@"FBClient reportPlay time is: %@", [NSDate date] );
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                   @"http://beatenigma.com/index.htm", @"game",
                                   [self getDateString], @"start_time",
                                   nil];
    
    [facebook requestWithGraphPath:[NSString stringWithFormat:@"/me/games.plays", appId] 
                         andParams:params 
                     andHttpMethod:@"POST"
                       andDelegate:self];    
}

-(void) got2facebookApp
{    
    BOOL didOpenOtherApp = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"fb://page/193477160729164", appId]] ];
    
    if (!didOpenOtherApp) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://m.facebook.com/beatenigma?v=feed"] ];
    }
}

- (void) logout
{
    [facebook logout:self];
}


@end