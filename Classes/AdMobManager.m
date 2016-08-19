//
//  AdMobManager.m
//  iNigma
//
//  Created by Francisco Padilla on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AdMobManager.h"
#import "cocos2d.h"

@implementation AdMobManager

static AdMobManager* sharedAdMobMgr;

- (id)init
{
    self = [super init];
    if (self) {
       /* bannerView_ = [[GADBannerView alloc]
                       initWithFrame:CGRectMake((480-320)/2,
                                                0,
                                                GAD_SIZE_320x50.width,
                                                GAD_SIZE_320x50.height)];
        
        // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
        bannerView_.adUnitID = @"a14e48262811bf5";
        
        // Let the runtime know which UIViewController to restore after taking
        // the user wherever the ad goes and add it to the view hierarchy.
        bannerView_.rootViewController = self;
        
        [[[CCDirector sharedDirector] openGLView] addSubview:bannerView_];
        
        // Initiate a generic request to load it with an ad.
        [self sendRequest];*/
    }
    
    return self;
}


- (void) sendRequest
{
    GADRequest *request = [GADRequest request];
    
    request.testDevices = [NSArray arrayWithObjects:
                           @"000000000000100080000017F2DAB338",            // Simulator
                           @"1f4d3193b9d3987afa37a294b18884f188deb6d7",    // Francisco's iTouch
                           nil];
    [bannerView_ loadRequest: request];
}

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView
{
    bannerView_.hidden = NO;
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"AdMob: didFailToReceiveAdWithError: %@", [error localizedDescription]);
    bannerView_.hidden = YES;
}

- (void)adViewWillPresentScreen:(GADBannerView *)bannerView
{
    [[CCDirector sharedDirector] stopAnimation];
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{
    [[CCDirector sharedDirector] startAnimation];    
}

- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView
{
    
}

@end
