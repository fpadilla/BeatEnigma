//
//  Machine.h
//  iNigma
//
//  Created by Francisco Padilla on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BackLayer.h"
#import "FrontLayer.h"
#import "Animation.h"

@interface Machine : NSObject 
{
	BackLayer  *backLayer;
	FrontLayer *frontLayer;
	float damagePercent;
	
@private
	int animationIndex;
	NSMutableArray *animations;
}

@property(readwrite) BackLayer *backLayer;
@property(readwrite) FrontLayer *frontLayer;
@property(assign) float damagePercent;

-(id) initWithParameters:(NSDictionary*) parameters;
-(void) runAnimations;

@end
