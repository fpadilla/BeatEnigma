//
//  iAdController.h
//  iNigma
//
//  Created by Francisco Padilla Obregon on 10/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import "GADBannerView.h"

typedef enum { AdTopPosition, AdBottomPosition } AdPosition;

typedef enum { NoPendigAd, iAdPendingAd, admobPendigAd } PendigAd;

@interface AdManager : NSObject < ADBannerViewDelegate, GADBannerViewDelegate>
{
    AdPosition position;
    CGRect frame;
    
    ADBannerView *iAdBanner;
    GADBannerView *adMobBanner;
    
    BOOL iAdBannerVisible;
    BOOL adMobBannerVisible;
    
    BOOL enabled;
    PendigAd pendingAd;

}
@property(assign) AdPosition position;
@property(assign) BOOL enabled;

+(AdManager*) sharedAdMgr;
-(id) init;
-(void) start;
-(void) stop;

-(void) enable;
-(void) disable;

-(void) sendAdMobRequest;

-(void) hideBanner:(UIView*) banner;
-(void) showBanner:(UIView*) banner;

@end
