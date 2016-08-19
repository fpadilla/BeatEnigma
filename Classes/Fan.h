//
//  Fan.h
//  iNigma
//
//  Created by Francisco Padilla on 6/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Asset.h";

@interface Fan : Asset {
	NSArray *paddles;
	float speed;

}

+(id) fanWithSpriteName:(NSString*) spriteName;
-(id) initWithSpriteName:(NSString*) spriteName;
-(void) update:(ccTime) dt;
-(void) updateStatus:(float)damagePercent;
-(void) desacelerate;
@end
