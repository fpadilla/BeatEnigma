//
//  Animation.h
//  iNigma
//
//  Created by Francisco Padilla on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"


#define Pixels2Meters 6417.322834645669291

@interface Animation : NSObject 
{
	NSString *type;
	NSString *name;
	
	NSString *spriteFrameName;
	CGPoint position;
	CGPoint variance;
	NSString *fileName;
	NSTimeInterval interval;
	CGPoint speed;
	int zOrder;
	float opacity;
	int count;
	
	int damagePercent;
}

@property(assign) int damagePercent;

+(id) animationWithParameters:(NSDictionary*) parameters;

+(id) animAt:(float)time addSprite:(NSString*) aSpriteFrameName position:(CGPoint)aPosition opacity:(int)aOpacity;
+(id) animAt:(float)time startAnimation:(NSString*)namePrefix  position:(CGPoint)aPosition frames:(int)numFrames interval:(float)aInterval;
+(id) animAt:(float)time fadeIn:(NSString*) spriteName interval:(float)aInterval;
+(id) animAt:(float)time fadeOut:(NSString*) spriteName interval:(float)aInterval;
+(id) animAt:(float)time playSound:(NSString*) soundFile;
+(id) animAt:(float)time changeOpacity:(NSString*) spriteName opacity:newOpacity;
+(id) animAt:(float)time showParticules:(NSString*) afileName;
+(id) animAt:(float)time accelerateBy:(CGPoint) acceleration sprite:(NSString*) spriteName;
+(id) animAt:(float)time changeSprite:(NSString*) spriteName toSpriteFrame:(NSString*) newSpriteFrameName;

-(id) initAt:(float)time addSprite:(NSString*) aSpriteFrameName position:(CGPoint)aPosition opacity:(int)aOpacity;
-(id) initAt:(float)time startAnimation:(NSString*)namePrefix  position:(CGPoint)aPosition frames:(int)numFrames interval:(float)aInterval;
-(id) initAt:(float)time fadeIn:(NSString*) spriteName interval:(float)aInterval;
-(id) initAt:(float)time fadeOut:(NSString*) spriteName interval:(float)aInterval;
-(id) initAt:(float)time playSound:(NSString*) soundFile;
-(id) initAt:(float)time changeOpacity:(NSString*) spriteName opacity:newOpacity;
-(id) initAt:(float)time showParticules:(NSString*) afileName;
-(id) initAt:(float)time accelerateBy:(CGPoint) acceleration sprite:(NSString*) spriteName;
-(id) initAt:(float)time changeSprite:(NSString*)spriteName toSpriteFrame:(NSString*)newSpriteFrameName ;

+(void) load;
-(id) initWithParameters:(NSDictionary*) parameters;
-(void) loadAssets;
-(void) runWithLayer:(CCLayer *) layer;
-(void) dealloc;

@end

/*******************************
  Accelerate Action 
*******************************/

@interface AccelerateMotion : CCActionInterval <NSCopying>
{
	CGPoint acceleration;
	CGPoint speed;
	float	rotSpeed;

	float delta ;
}
+(id) actionWithDuration:(ccTime) t initialSpeed:(CGPoint) iSpeed acceleration:(CGPoint) a rotationSpeed:(float) aRotSpeed;
-(id) initWithDuration:(ccTime) t initialSpeed:(CGPoint) iSpeed acceleration:(CGPoint) a rotationSpeed:(float) aRotSpeed;
@end

@interface ShowParticleSystem : CCActionInterval
{
	CCParticleSystem *particleSystem;
	BOOL updatePosition;
}

@property(retain) CCParticleSystem *particleSystem;

-(id) initWithParticleSys:(CCParticleSystem*)aParticleSystem updatePosition:(BOOL) isUpdatePosition;
+(id) actionWithParticleSys:(CCParticleSystem*)aParticleSystem updatePosition:(BOOL) isUpdatePosition;

@end

@interface PlayEffect : CCActionInterval
{
	NSString *sndEffect;
}
+(id) actionWithFile:(NSString *)fileName;
-(id) initWithFile:(NSString *)fileName;


@end

@interface Shake : CCActionInterval
{
	float amplitude;
}
+(id) actionWithDuration:(float)duration amplitude:(float)newAmplitude;
-(id) initWithFile:(NSString *)fileName;


@end

/////////////////////////////////////////////////////

/** CCShuffleTiles action
 Shuffle the tiles in random order
 */
@interface CCExploteTiles : CCTiledGrid3DAction
{
	int	seed;
	int tilesCount;
	int *tilesOrder;
	void *tiles;
}

/** creates the action with a random seed, the grid size and the duration */
+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;
/** initializes the action with a random seed, the grid size and the duration */
-(id)initWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d;

@end


/////////////////////////////////////////////////////

/** Remove action
 Remove CCNode from parent
 */
@interface Remove : CCActionInterval
{
}

/** creates the action  */
+(id)action;
/** initializes the action */
-(id)init;

@end
