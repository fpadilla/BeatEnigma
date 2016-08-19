//
//  Chartboost.h
//  iNigma
//
//  Created by Francisco Padilla on 10/23/12.
//
//

#import <Foundation/Foundation.h>
#import "Chartboost.h"
#import "UserTracking.h"
#import "cocos2d.h"

@interface ChartboostManager : NSObject<ChartboostDelegate>
{
    Chartboost *cb;
}
@property(readonly) Chartboost *cb;

// Called before requesting an interstitial from the back-end
- (BOOL)shouldRequestInterstitial:(NSString *)location;

// Called when an interstitial has been received, before it is presented on screen
// Return NO if showing an interstitial is currently inappropriate, for example if the user has entered the main game mode
- (BOOL)shouldDisplayInterstitial:(NSString *)location;

// Called when the user dismisses the interstitial
- (void)didDismissInterstitial:(NSString *)location;

// Same as above, but only called when dismissed for a close
- (void)didCloseInterstitial:(NSString *)location;

// Same as above, but only called when dismissed for a click
- (void)didClickInterstitial:(NSString *)location;

// Called when an interstitial has failed to come back from the server
// This may be due to network connection or that no interstitial is available for that user
- (void)didFailToLoadInterstitial:(NSString *)location;

#pragma mark Display More Apps

// Called when an more apps page has been received, before it is presented on screen
// Return NO if showing the more apps page is currently inappropriate
- (BOOL) shouldDisplayMoreApps;

// Called before requesting the more apps view from the back-end
// Return NO if when showing the loading view is not the desired user experience
- (BOOL) shouldDisplayLoadingViewForMoreApps;

// Called when the user dismisses the more apps view
- (void) didDismissMoreApps;

// Same as above, but only called when dismissed for a close
- (void) didCloseMoreApps;

// Same as above, but only called when dismissed for a click
- (void) didClickMoreApps;

// Called when a more apps page has failed to come back from the server
- (void) didFailToLoadMoreApps;

// Called when the More Apps page has been received and cached
- (void) didCacheMoreApps;

@end
