//
//  Twitter.h
//  iNigma
//
//  Created by Francisco Padilla on 10/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SA_OAuthTwitterController.h"

#define kOAuthConsumerKey				@"cgwgX2Y956KQQtHSeGBuQ"		//REPLACE ME
#define kOAuthConsumerSecret			@"LBP8RgXsSs4BrDDzhpH8nZgseYoMHi37TQOgB2wCrY"		//REPLACE ME

@interface Twitter : NSObject <SA_OAuthTwitterControllerDelegate> {
	SA_OAuthTwitterEngine *engine;
    void (^callback)(void);        
}
@property(readwrite) SA_OAuthTwitterEngine	*engine;
+(Twitter*) sharedTwitterClient;
-(void) confirmUpdate:(NSString*) message;
-(void) disableUpdatesFor:(NSString*) username;
-(void) enableUpdatesFor:(NSString*) username;
-(void) sendUpdate:(NSString*) message;

@end
