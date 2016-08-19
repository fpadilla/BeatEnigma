//
//  Twitter.m
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Twitter.h"
#import "SA_OAuthTwitterEngine.h"
#import "GameFlow.h"
#import <Twitter/Twitter.h>

// authorize ok or cancel

// sendUpdate post // scores  ->string
// like follow // 

@implementation Twitter

static Twitter *sharedTwitterClient;
+(Twitter*) sharedTwitterClient
{
    if (sharedTwitterClient == nil) {
        sharedTwitterClient = [[[Twitter alloc] init] retain];
    }
    return sharedTwitterClient;
}

@synthesize engine;



-(void) sendUpdate5:(NSString *)message
{
    // Create the view controller
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];

    // Optional: set an image, url and initial text
    [twitter addImage:[UIImage imageNamed:@"Icon.png"]];
    [twitter addURL:[NSURL URLWithString:[NSString stringWithString:@"http://beatenigma.com/"]]];
    [twitter setInitialText:message];

    // Show the controller
    UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] viewController];

    [rootViewController presentModalViewController:twitter animated:YES];

    // Called when the tweet dialog has been closed
    twitter.completionHandler = ^(TWTweetComposeViewControllerResult result) 
        {
            NSString *title = @"Tweet Status";
            NSString *msg; 
            
            if (result == TWTweetComposeViewControllerResultDone){
                msg = @"Tweet composition completed.";
                // Show alert to see how things went...
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [alertView show];
            }
            
            // Dismiss the controller
            [rootViewController dismissModalViewControllerAnimated:YES];
        };
}

-(void) sendUpdate:(NSString*) message
{
    Class twitterControllerClass = (NSClassFromString(@"TWTweetComposeViewController"));
    
    if (twitterControllerClass != NULL) {
        [self sendUpdate5:message ];
        return;
    }
        
        
    NSString *newMessage = [ message stringByAppendingString:@" #beatenigma http://beatenigma.com"];
    
    if(engine.isAuthorized){
        [self confirmUpdate:newMessage];        
    } else{
        callback = ^{ 
            [[Twitter sharedTwitterClient] confirmUpdate:newMessage]; 
        };
        callback = [callback copy];  
        
        UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: engine delegate: self];
        if (controller) 
            [[[[UIApplication sharedApplication] delegate] viewController] presentModalViewController: controller animated: YES];
    }
}

-(void) confirmUpdate:(NSString*) message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[@"Twitter Account: " stringByAppendingString:[engine username]]
                                                        message:message 
                                                       delegate:self 
                                              cancelButtonTitle:@"Cancel" 
                                              otherButtonTitles:@"Tweet", nil];
    [alertView show];
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
   /* CGRect frame = [alertView frame];
    frame.size.width = 480;
    frame.size.height= 320;
    [alertView sizeThatFits:frame.size];
   alertView.frame = frame;*/
}


- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex{    
    //NSLog(@"%d", (int) buttonIndex);
    if (buttonIndex == 1) { // Tweet pushed
        [engine sendUpdate: alert.message ];
    } 
}

-(void) disableUpdatesFor:(NSString*) username
{
    if(engine.isAuthorized){
        [engine disableUpdatesFor: username];
    } else{
        callback = ^{ 
            [[Twitter sharedTwitterClient].engine disableUpdatesFor: username]; 
        };
        callback = [callback copy];        
        
        UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: engine delegate: self];
        if (controller) 
            [[[[UIApplication sharedApplication] delegate] viewController] presentModalViewController: controller animated: YES];
    }
}

-(void) enableUpdatesFor:(NSString*) username
{
    if(engine.isAuthorized){
        [engine enableUpdatesFor: username];     
        [[[UIAlertView alloc] initWithTitle:@"Thanks!" message:@"Thanks for follwing us. Stay tuned about future updates." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    } else{
        callback = ^{ 
            [[Twitter sharedTwitterClient].engine enableUpdatesFor: username]; 
            [[[UIAlertView alloc] initWithTitle:@"Thanks!" message:@"Thanks for follwing us. Stay tuned about future updates." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];            
        };
        callback = [callback copy];

        UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: engine delegate: self];
        if (controller) 
            [[[[UIApplication sharedApplication] delegate] viewController] presentModalViewController: controller animated: YES];
    }
}

- (id)init
{
    NSAssert(sharedTwitterClient == nil, @"Twitter init: Duplicated instance of Twitter class");
    
    self = [super init];
    if (self) {
        engine = [[[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate: self] retain];
        engine.consumerKey = kOAuthConsumerKey;
        engine.consumerSecret = kOAuthConsumerSecret;
        
        UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: engine delegate: self];
        if (controller) 
            [[[[UIApplication sharedApplication] delegate] viewController] presentModalViewController: controller animated: YES];
    }
    return self;
}

//==============================================================================================

#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
    
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
    // return nil;
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

//==============================================================================================

#pragma mark SA_OAuthTwitterControllerDelegate

- (void) OAuthTwitterController: (SA_OAuthTwitterController *) controller authenticatedWithUsername: (NSString *) username {

	//NSLog(@"Twitter OAuthTwitterController: Authenicated for %@", username);
    [[GameFlow sharedGameFlow] reportAchievementIdentifier:@"5001" percentComplete:100.0];
    [engine enableUpdatesFor:@"BeatEnigma"];

    if (callback){
       callback();
        [callback release];
        callback = nil;
    }
}

- (void) OAuthTwitterControllerFailed: (SA_OAuthTwitterController *) controller {
    if (callback){
        [callback release];
    }
    
    //NSLog(@"Twitter OAuthTwitterControllerFailed Authentication Failed!");
}

- (void) OAuthTwitterControllerCanceled: (SA_OAuthTwitterController *) controller {
    if (callback){
        [callback release];
    }
	//NSLog(@"Twitter OAuthTwitterControllerCanceled Authentication Canceled.");
}

//==============================================================================================

#pragma mark TwitterEngineDelegate

- (void) requestSucceeded: (NSString *) requestIdentifier {
	//NSLog(@"Twitter requestSucceeded %@ succeeded", requestIdentifier);
}

- (void) requestFailed: (NSString *) requestIdentifier withError: (NSError *) error {
	//NSLog(@"Twitter requestFailed Request %@ failed with error: %@", requestIdentifier, error);
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter Issue"
                                                        message:[error localizedDescription] 
                                                       delegate:self 
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];

}

//==============================================================================================

#pragma mark Other Stuff

- (void)dealloc {
	[engine release];
    [super dealloc];
}

@end
