//
//  AdMobManager.h
//  iNigma
//
//  Created by Francisco Padilla on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADBannerView.h"

@interface AdMobManager : NSObject <GADBannerViewDelegate>
{
    GADBannerView *bannerView_;
}
@end
