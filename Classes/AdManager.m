//
//  iAdController.m
//  iNigma
//
//  Created by Francisco Padilla Obregon on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AdManager.h"
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
@class GameFlow; // #import "GameFlow.h"

@implementation AdManager

static AdManager* sharedAdMgr;

@synthesize position;

- (id)init
{
    NSAssert(sharedAdMgr == nil, @"Duplicated allocation sharedAdMgr");
    
    self = [super init];
    if (self) {
        self.position = AdBottomPosition;
        if (position == AdTopPosition) {
            frame = CGRectMake( (480-320)/2, 0, 320, 50);
        } else {
            frame = CGRectMake( (480-320)/2, 320-50, 320, 50);            
        }

        // [self setupiAd]; // iAds doesn't not allow manual refresh
        adMobBannerVisible = NO;
        [self setupAdMob];
        
        // send anmob request and keep it pending
        enabled = YES;
        [self sendAdMobRequest];
    }
    return self;
}

+(AdManager*) sharedAdMgr
{
    if (sharedAdMgr == nil) {
        sharedAdMgr = [[[[AdManager alloc] init] autorelease] retain];
    }
    return sharedAdMgr;
}

-(void) start
{
    // [self setupiAd];
    if (adMobBanner == nil) {
        [self setupAdMob];
    }
    [self sendAdMobRequest];
}

-(void) stop
{
    if (iAdBanner != nil) {
        if (iAdBannerVisible) {
            [self hideBanner:iAdBanner];
            iAdBannerVisible = NO;
        }
        [iAdBanner removeFromSuperview];
        iAdBanner = nil;
    }
    
    if( adMobBanner != nil ) {
        if (adMobBannerVisible) {
            [self hideBanner:adMobBanner];
            adMobBannerVisible = NO;
        }
        [adMobBanner removeFromSuperview];
        adMobBanner = nil;
    }
}

-(void) enable
{
    enabled = YES;
    [self start];
    
    /*if (pendingAd == iAdPendingAd) {
        [self bannerViewDidLoadAd:iAdBanner];
    } 
     
    if (pendingAd == admobPendigAd) {
        [self adViewDidReceiveAd:adMobBanner];
    }*/
}

-(void) disable
{
    enabled = NO;
    [self stop];
    
    /*if (iAdBanner != nil && iAdBannerVisible) {
        [self hideBanner:iAdBanner];
        iAdBannerVisible = NO;
    }
    
    if( adMobBanner != nil && adMobBannerVisible ) {
        [self hideBanner:adMobBanner];
        adMobBannerVisible = NO;
    }*/
}

-(void) showBanner:(UIView*) banner
{
    [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
    if (position == AdTopPosition) {
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
    } else {
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
    }
    //banner.hidden = NO;
    
    CGRect r  = banner.frame;
    //NSLog(@"show %f,%f,%f,%f", r.origin.x, r.origin.y, r.size.width, r.size.height);
    
    [UIView commitAnimations];
}

-(void) hideBanner:(UIView*) banner
{
    [UIView beginAnimations:@"animateAdBannerOf" context:NULL];
    if (position == AdTopPosition) {
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
    } else {
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
    }
    //banner.hidden = NO;
    
    CGRect r  = banner.frame;
    //NSLog(@"hide %f,%f,%f,%f", r.origin.x, r.origin.y, r.size.width, r.size.height);

    [UIView commitAnimations];
}

#pragma mark iAd Stuff

-(void) setupiAd
{
    if ( (NSClassFromString(@"ADBannerView")) != nil ) {    
        iAdBanner = [[[ADBannerView alloc] initWithFrame:frame] autorelease];
    
        NSSet *set = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
        iAdBanner.requiredContentSizeIdentifiers = set;
        iAdBanner.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;        
        iAdBanner.delegate = self;
        //iAdBanner.autoresizingMask = UIViewAutoresizingNone;
        
        [[[CCDirector sharedDirector] openGLView] addSubview:iAdBanner];
        [self hideBanner:iAdBanner];
        iAdBannerVisible = NO;
    }
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    BOOL isMultitaskingSupported = [[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] 
                                && [[UIDevice currentDevice] isMultitaskingSupported];
    if (willLeave) {
        if (isMultitaskingSupported){
            [[GameFlow sharedGameFlow] pause]; 
            [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
            return YES;
        } else
            return NO;        
    } else {
        [[CCDirector sharedDirector] stopAnimation];
        [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    
    }
    return isMultitaskingSupported;
}

-(void) bannerViewActionDidFinish:(ADBannerView *)banner
{
    [[CCDirector sharedDirector] startAnimation];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
}

-(void) reportBannerPosition
{
    //CCLOG(@"iAd %f, AdMob: %f", adView.frame.origin.y, bannerView_.frame.origin.y);
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"iAd: bannerViewDidLoadAd iAdBannerVisible:%i", iAdBannerVisible);
    
    if (!enabled){
        pendingAd = iAdPendingAd;
        return;
    } 
    
    if (!iAdBannerVisible)
    {
        [self showBanner:iAdBanner];
        iAdBannerVisible = TRUE;
        pendingAd = NoPendigAd;
    }
    
    if (adMobBannerVisible) {
        NSLog(@"Hidding AdMob Banner");
        [self hideBanner:adMobBanner];
        //adMobBanner.hidden = YES;
        adMobBannerVisible = NO;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"iAd: didFailToReceiveAdWithError:%@ iAdBannerVisible:%i",  [error localizedDescription],iAdBannerVisible)
    ;
    if (iAdBannerVisible)
    {
        [self hideBanner:iAdBanner];
        iAdBannerVisible = NO;
    }
   [self sendAdMobRequest]; 
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    /*if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    else
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;*/
}


#pragma mark AdMob Stuff

-(void) setupAdMob
{
    adMobBanner = [[[GADBannerView alloc] initWithFrame:CGRectMake((480-320)/2,
                                                                  320-50,
                                                                  GAD_SIZE_320x50.width,
                                                                  GAD_SIZE_320x50.height)] autorelease];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    adMobBanner.adUnitID = @"058d037db60a4fa9";//  a14e48262811bf5
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    adMobBanner.rootViewController = [[[UIApplication sharedApplication] delegate] viewController];
    adMobBanner.delegate = self;
    
    [[[CCDirector sharedDirector] openGLView] addSubview:adMobBanner];
    [self hideBanner:adMobBanner];
    adMobBannerVisible = NO;

    // Initiate a generic request to load it with an ad.
    // [self sendRequest];
    adMobBanner.autoresizingMask = UIViewAutoresizingNone;
}

- (void) sendAdMobRequest
{
    if (pendingAd == admobPendigAd) {
        [self adViewDidReceiveAd:adMobBanner];
        return;
    }
    
    if ( adMobBanner == nil) return;
    GADRequest *request = [GADRequest request];
    [adMobBanner loadRequest: request];
    NSLog(@"AdMob: request sent");
}

- (void) adViewDidReceiveAd:(GADBannerView *)bannerView
{
    NSLog(@"AdMob: adViewDidReceiveAd");

    if (!enabled){
        pendingAd = admobPendigAd;
    } else if ( !adMobBannerVisible && !iAdBannerVisible){
        [self showBanner:adMobBanner];
        adMobBannerVisible = YES;
        pendingAd = NoPendigAd;
    }
    
    
}

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error
{
    NSLog(@"AdMob: didFailToReceiveAdWithError: %@ y:", [error localizedDescription]);    
    if ( adMobBannerVisible){
        [self hideBanner:adMobBanner];
        //adMobBanner.hidden = YES;
        adMobBannerVisible = NO;        
        // TODO: Show own ads paid version app
    }
}

- (void)adViewWillPresentScreen:(GADBannerView *)bannerView
{
    [[CCDirector sharedDirector] stopAnimation];
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
}

- (void)adViewDidDismissScreen:(GADBannerView *)bannerView
{
    [[CCDirector sharedDirector] startAnimation];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
}

- (void)adViewWillLeaveApplication:(GADBannerView *)bannerView
{
    [[GameFlow sharedGameFlow] pause]; 
}

@end
