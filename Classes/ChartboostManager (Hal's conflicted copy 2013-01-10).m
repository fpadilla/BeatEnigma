//
//  Chartboost.m
//  iNigma
//
//  Created by Francisco Padilla on 10/23/12.
//
//

#import "ChartboostManager.h"

@implementation ChartboostManager

@synthesize cb;

-(ChartboostManager*) init
{
    if (self = [super init]) {
        cb = [Chartboost sharedChartboost];
        cb.appId = @"5085bee716ba476b4f000000";
        cb.appSignature = @"a65539378aa9c758bcb48d5542d20a5d21e3b7a2";
        cb.delegate = self;
        [cb startSession];
    }
    return self;
}

// Called before requesting an interstitial from the back-end
- (BOOL)shouldRequestInterstitial:(NSString *)location
{
    if ([[UserTracking sharedUserTracking] hasPowerUp:@"NO_ADS" ]) {
        return NO;
    }
    return YES;
}

// Called when an interstitial has been received, before it is presented on screen
// Return NO if showing an interstitial is currently inappropriate, for example if the user has entered the main game mode
- (BOOL)shouldDisplayInterstitial:(NSString *)location
{
    [[CCDirector sharedDirector] stopAnimation];
    return YES;
}

// Called when the user dismisses the interstitial
- (void)didDismissInterstitial:(NSString *)location
{
    [[CCDirector sharedDirector] startAnimation];  
}

// Same as above, but only called when dismissed for a close
- (void)didCloseInterstitial:(NSString *)location
{
    [[CCDirector sharedDirector] startAnimation]; 
}

// Same as above, but only called when dismissed for a click
- (void)didClickInterstitial:(NSString *)location
{
    [[CCDirector sharedDirector] startAnimation];
}

// Called when an interstitial has failed to come back from the server
// This may be due to network connection or that no interstitial is available for that user
- (void)didFailToLoadInterstitial:(NSString *)location
{
    
}

#pragma mark Display More Apps

// Called when an more apps page has been received, before it is presented on screen
// Return NO if showing the more apps page is currently inappropriate
- (BOOL) shouldDisplayMoreApps
{
    [[CCDirector sharedDirector] stopAnimation];
    return YES;
}

// Called before requesting the more apps view from the back-end
// Return NO if when showing the loading view is not the desired user experience
- (BOOL) shouldDisplayLoadingViewForMoreApps
{
    return YES;
}

// Called when the user dismisses the more apps view
- (void) didDismissMoreApps
{
    [[CCDirector sharedDirector] startAnimation];
}

// Same as above, but only called when dismissed for a close
- (void) didCloseMoreApps
{
    [[CCDirector sharedDirector] startAnimation];
}

// Same as above, but only called when dismissed for a click
- (void) didClickMoreApps
{
    [[CCDirector sharedDirector] startAnimation];
}

// Called when a more apps page has failed to come back from the server
- (void) didFailToLoadMoreApps
{
    //[[CCDirector sharedDirector] startAnimation];
}

// Called when the More Apps page has been received and cached
- (void) didCacheMoreApps
{

}

@end
