//
//  iNigmaAppDelegate.m
//  iNigma
//
//  Created by Francisco Padilla on 3/8/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import "cocos2d.h"

#import "iNigmaAppDelegate.h"
#import "GameConfig.h"
#import "RootViewController.h"

#import "GameFlow.h"
#import "GameMechanics.h"
#import "UserTracking.h"

#import "Appirater.h"
#import "AdManager.h"
#import "FBClient.h"
#import "GameCenter.h"
#import "FBClient.h"
#import "Twitter.h"
#import "FlurryAnalytics.h"

#ifdef LITE_VERSION
#import <RevMobAds/RevMobAds.h>
#endif

void uncaughtExceptionHandler(NSException *exception) {
    [FlurryAnalytics logError:@"Uncaught" message:@"Crash!" exception:exception];
}

@implementation iNigmaAppDelegate

@synthesize window, viewController;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
	
	//	CC_ENABLE_DEFAULT_GL_STATES();
	//	CCDirector *director = [CCDirector sharedDirector];
	//	CGSize size = [director winSize];
	//	CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
	//	sprite.position = ccp(size.width/2, size.height/2);
	//	sprite.rotation = -90;
	//	[sprite visit];
	//	[[director openGLView] swapBuffers];
	//	CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
    
    [[GameCenter sharedGameCenter] authenticateLocalPlayer];

#ifdef LITE_VERSION
    chartBoostMgr = [[ChartboostManager alloc] init];
    [chartBoostMgr.cb cacheInterstitial];
    if (![[UserTracking sharedUserTracking] hasPowerUp:@"NO_ADS" ]) {
        [RevMobAds startSessionWithAppID:@"5085f12f31e6fb0c00000001"];
        [RevMobAds showFullscreenAd];
    }
#endif
    
    [Twitter sharedTwitterClient];
    [FBClient sharedFBClient];
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
#ifndef DEBUG    
#ifdef LITE_VERSION
    [FlurryAnalytics startSession:@"YZH469PM9CK9N7JHYYTR"];
#else
    [FlurryAnalytics startSession:@"JBEYCHHKNFFFHSMVESBJ"];
#endif
#endif
    
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Try to use CADisplayLink director
	// if it fails (SDK < 3.1) use the default director
	if( ! [CCDirector setDirectorType:kCCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:kCCDirectorTypeDefault];
	
	
	CCDirector *director = [CCDirector sharedDirector];
	
	// Init the View Controller
	viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	viewController.wantsFullScreenLayout = YES;

	//
	// Create the EAGLView manually
	//  1. Create a RGB565 format. Alternative: RGBA8
	//	2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
	//
	//
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
								   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
						];
	
	// attach the openglView to the director
	[director setOpenGLView:glView];
    
//	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
//	if( ! [director enableRetinaDisplay:YES] )
//		CCLOG(@"Retina Display Not supported");
	
	//
	// VERY IMPORTANT:
	// If the rotation is going to be controlled by a UIViewController
	// then the device orientation should be "Portrait".
	//
	// IMPORTANT:
	// By default, this template only supports Landscape orientations.
	// Edit the RootViewController.m file to edit the supported orientations.
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
    //[director setDeviceOrientation:kCCDeviceOrientationPortrait];
#else
	[director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
#endif
	
	[director setAnimationInterval:1.0/60];
    
#ifdef DEBUG
	[director setDisplayFPS:YES];
#endif
	
	// make the OpenGLView a child of the view controller
	[viewController setView:glView];
	
	// make the View Controller a child of the main window
	[window addSubview: viewController.view];
	[window makeKeyAndVisible];
	
	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
	
	// Removes the startup flicker
	[self removeStartupFlicker];
	window.rootViewController = viewController;
    
#ifdef LITE_VERSION
    AdManager *adMgr = [AdManager sharedAdMgr];
#endif
    
    // Detector de Piratas
    NSBundle *bundle = [NSBundle mainBundle];
    NSDictionary *info = [bundle infoDictionary];
    /*NSLog(@"Transpositional Cipher:");
    char csignid[] = "SignerIdentity";
    NSLog(@"%s",csignid);
    for(int i=0;i<strlen(csignid);i++)
         csignid[i] = csignid[i]-10;
    NSLog(@"%s",csignid);
    for(int i=0;i<strlen(csignid);i++)
     csignid[i] = csignid[i]+10;
    NSLog(@"%s",csignid);*/
    
    char csignid[] = "I_]d[h?Z[dj_jo";
    for(int i=0; i<strlen(csignid); i++)
     csignid[i] = csignid[i]+10;
    NSString* signIdentity = [[NSString alloc] initWithCString:csignid encoding:NSUTF8StringEncoding];
    NSLog(@"checking for %@", signIdentity);
    BOOL checked = NO;
    if ([info objectForKey: signIdentity] != nil || [info objectForKey: signIdentity] == nil)
    {
        checked = YES;
    }
    
    if (!checked || [info objectForKey: signIdentity] != nil ) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults objectForKey:@"Drake"] == nil) {
            [defaults setBool:YES forKey:@"Drake"];
            [FlurryAnalytics logEvent:@"Drake"];
            NSLog(@"Drake!");
        }
    }
    
	[GameMechanics loadResources];
	[[GameFlow sharedGameFlow] goMainMenu];
    [[GameFlow sharedGameFlow] showUpdateMessage];

	// [[UserTracking sharedUserTracking] Log:OPEN_APP];
    
    [Appirater appLaunched:YES];
    
}

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self applicationDidFinishLaunching:application];

#if !TARGET_IPHONE_SIMULATOR
	// Let the device know we want to receive push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationType)(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert)];
    
    NSDictionary *remoteNotif =[launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotif) {
        NSString *link = [remoteNotif objectForKey:@"link"];
        [application openURL:[NSURL URLWithString:link]];
    }
    
#endif
    
    application.applicationIconBadgeNumber = 0;
    
    [ASTStoreController sharedStoreController];

    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)devToken
{
	NSLog(@"My token is: %@", devToken);
    
#if !TARGET_IPHONE_SIMULATOR
    
	// Get Bundle Info for Remote Registration (handy if you have more than one app)
	NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
	NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
	// Check what Notifications the user has turned on.  We registered for all three, but they may have manually disabled some or all of them.
	NSUInteger rntypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    
	// Set the defaults to disabled unless we find otherwise...
	NSString *pushBadge = (rntypes & UIRemoteNotificationTypeBadge) ? @"enabled" : @"disabled";
	NSString *pushAlert = (rntypes & UIRemoteNotificationTypeAlert) ? @"enabled" : @"disabled";
	NSString *pushSound = (rntypes & UIRemoteNotificationTypeSound) ? @"enabled" : @"disabled";
    
	// Get the users Device Model, Display Name, Unique ID, Token & Version Number
	UIDevice *dev = [UIDevice currentDevice];
	NSString *deviceUuid;
	if ([dev respondsToSelector:@selector(uniqueIdentifier)])
		deviceUuid = dev.uniqueIdentifier;
	else {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		id uuid = [defaults objectForKey:@"deviceUuid"];
		if (uuid)
			deviceUuid = (NSString *)uuid;
		else {
			CFStringRef cfUuid = CFUUIDCreateString(NULL, CFUUIDCreate(NULL));
			deviceUuid = (NSString *)cfUuid;
			CFRelease(cfUuid);
			[defaults setObject:deviceUuid forKey:@"deviceUuid"];
		}
	}
	NSString *deviceName = dev.name;
	NSString *deviceModel = dev.model;
	NSString *deviceSystemVersion = dev.systemVersion;
    
	// Prepare the Device Token for Registration (remove spaces and < >)
	NSString *deviceToken = [[[[devToken description]
                               stringByReplacingOccurrencesOfString:@"<"withString:@""]
                              stringByReplacingOccurrencesOfString:@">" withString:@""]
                             stringByReplacingOccurrencesOfString: @" " withString: @""];
    
	// Build URL String for Registration
	// !!! CHANGE "www.mywebsite.com" TO YOUR WEBSITE. Leave out the http://
	// !!! SAMPLE: "secure.awesomeapp.com"
	NSString *host = @"54.243.177.205";
    
	// !!! CHANGE "/apns.php?" TO THE PATH TO WHERE apns.php IS INSTALLED
	// !!! ( MUST START WITH / AND END WITH ? ).
	// !!! SAMPLE: "/path/to/apns.php?"
	NSString *urlString = [NSString stringWithFormat:@"/easyapns/apns.php?task=%@&appname=%@&appversion=%@&deviceuid=%@&devicetoken=%@&devicename=%@&devicemodel=%@&deviceversion=%@&pushbadge=%@&pushalert=%@&pushsound=%@", @"register", appName,appVersion, deviceUuid, deviceToken, deviceName, deviceModel, deviceSystemVersion, pushBadge, pushAlert, pushSound];
    
	// Register the Device Data
	// !!! CHANGE "http" TO "https" IF YOU ARE USING HTTPS PROTOCOL
	NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:host path:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	NSLog(@"Register URL: %@", url);
	NSLog(@"Return Data: %@", returnData);
	
#endif
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
	NSLog(@"Failed to get token, error: %@", error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

    application.applicationIconBadgeNumber = 0;
    
    // We can determine whether an application is launched as a result of the user tapping the action
    // button or whether the notification was delivered to the already-running application by examining
    // the application state.
    
    if (application.applicationState == UIApplicationStateActive) {
        // Nothing to do if applicationState is Inactive, the iOS already displayed an alert view.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Notification"
                                                            message:                                                                  [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        if ([userInfo objectForKey:@"link"]) {
            notificationLink = [[userInfo objectForKey:@"link"] retain];
        }
        [alertView show];
        [alertView release];
    }
}

// manage click on OK button when a remote notification come up and  application is running foreground
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1 && notificationLink != nil) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:notificationLink]];
    }
    
    if (notificationLink) {
        [notificationLink release];
        notificationLink = nil;
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (notificationLink) {
        [notificationLink release];
        notificationLink = nil;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	[[GameFlow sharedGameFlow] pause];
	[[CCDirector sharedDirector] pause];
    [[GameFlow sharedGameFlow] saveAchievements];
    NSLog(@"applicationWillResignActive was called");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	 [[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
    [Appirater appEnteredForeground:YES];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	CCDirector *director = [CCDirector sharedDirector];
	
	[[director openGLView] removeFromSuperview];
	[viewController release];
	[window release];
	[director end];	

	//[[UserTracking sharedUserTracking] Log:CLOSE_APP];
    [[GameFlow sharedGameFlow] saveAchievements];

}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	[[CCDirector sharedDirector] release];
	[window release];
	[super dealloc];
}

#pragma mark Facebook stuff
// Pre 4.2 support
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[FBClient sharedFBClient].facebook handleOpenURL:url]; 
}

// For 4.2+ support
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBClient sharedFBClient].facebook handleOpenURL:url]; 
}


@end
