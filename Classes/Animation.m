//
//  Animation.m
//  iNigma
//
//  Created by Francisco Padilla on 4/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Animation.h"
#import "CCActionTiledGrid.h"

typedef struct
{
	CGPoint	position;
	CGPoint	startPosition;
	ccGridSize	delta;
} Tile;

@implementation Animation

@synthesize damagePercent;

static NSMutableDictionary *dict;

+(void) load
{
	dict = [[[NSMutableDictionary alloc] initWithCapacity:10] retain];
}

+(id) animationWithParameters:(NSDictionary*) parameters
{
	Animation *animation = [[[Animation alloc] initWithParameters: parameters] autorelease];
	return animation;
}

-(id) initWithParameters:(NSDictionary*) parameters
{
	type = [[parameters objectForKey:@"type"] retain];
	name  = [[parameters objectForKey:@"name"]retain];
	spriteFrameName = [[parameters objectForKey:@"spriteFrameName"] retain];
	zOrder = [[parameters objectForKey:@"zOrder"] floatValue];
	opacity = [[parameters objectForKey:@"opacity"] floatValue];
	
	position.x = [[parameters objectForKey:@"position.x"] floatValue];
	position.y = [[parameters objectForKey:@"position.y"] floatValue];
	
	variance.x = [[parameters objectForKey:@"variance.x"] floatValue];
	variance.y = [[parameters objectForKey:@"variance.y"] floatValue];
	
	speed.x = [[parameters objectForKey:@"speed.x"] floatValue];
	speed.y = [[parameters objectForKey:@"speed.y"] floatValue];
	
	fileName = [[parameters objectForKey:@"fileName"] retain];
	interval = [[parameters objectForKey:@"interval"] floatValue];
	
	damagePercent = [[parameters objectForKey:@"damagePercent"] floatValue];
	count = [[parameters objectForKey:@"count"] intValue];
	
	return self;
}

-(void) dealloc
{
	[type release];
	[name release];
	[spriteFrameName release];
	[fileName release];
}

-(void) loadAssets
{
	if ( [type isEqualToString:@"playSound"] )
	{
		[[SimpleAudioEngine sharedEngine] preloadEffect:fileName];
	}
}

-(void) runWithLayer:(CCLayer *) layer
{	
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 

	if ( [type isEqualToString:@"addSprite"] )
	{
		CCSprite *sprite = [CCSprite spriteWithSpriteFrame:[frameCache spriteFrameByName:spriteFrameName] ];
		sprite.position = position;
		sprite.opacity = opacity;
		[sprite retain];
		[dict setObject:sprite forKey:name];
		[layer addChild:sprite z:0];
	}
	else if ( [type isEqualToString:@"changeSprite"] )
	{
		CCSprite *sprite = [dict objectForKey:name];
		CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
		CCSpriteFrame *spriteFrame = [frameCache spriteFrameByName:spriteFrameName];
		[sprite setDisplayFrame:spriteFrame];
	}
	else if ( [type isEqualToString:@"startAnimation"] )
	{
		CCSprite *sprite = [Animation spriteAnimationWithFramePattern:spriteFrameName 
														   frameCount:count 
																delay:interval ]; 
		sprite.position = position;
		[sprite runAction:[CCFadeIn actionWithDuration:interval] ];
		[layer addChild:sprite z:0];
		[dict setObject:sprite forKey:name];
	}
	else if ( [type isEqualToString:@"fadeIn"] )
	{
		CCSprite *sprite = [dict objectForKey:name];
		[sprite runAction:[CCFadeIn actionWithDuration:interval] ];
	}
	else if ( [type isEqualToString:@"fadeOut"] )
	{
		CCSprite *sprite = [dict objectForKey:name];
		[sprite runAction:[CCFadeOut actionWithDuration:interval] ];
	}
	else if ( [type isEqualToString:@"playSound"] )
	{
		ALuint alu = [[SimpleAudioEngine sharedEngine] playEffect:fileName];
		[dict setObject:[NSNumber numberWithInt:alu] forKey:name];
	}
	else if ( [type isEqualToString:@"stopSound"] )
	{
		[[SimpleAudioEngine sharedEngine] stopEffect:
			[[dict objectForKey:name] intValue] 
		 ];
	}
	else if ( [type isEqualToString:@"changeAlpha"] )
	{
		CCSprite *sprite = [dict objectForKey:name];
		sprite.opacity = opacity;
	} 
	else if ( [type isEqualToString:@"particle"] )
	{
		CCParticleSystemPoint *hitParticles = [CCParticleSystemPoint particleWithFile:fileName];
		hitParticles.autoRemoveOnFinish = YES;
		[layer addChild: hitParticles];
	} 
	else if ( [type isEqualToString:@"accelerateBy"] )
	{
		CCSprite *sprite = [dict objectForKey:name];
		CGPoint pos = ccp( 5, 0 - sprite.contentSize.height/2 - sprite.position.y);
		[sprite runAction:[CCSpawn actions:
						   [AccelerateMotion actionWithDuration:0.5 initialSpeed:ccp(200,250) acceleration:ccp(0,-2000) rotationSpeed:180]
						   ,nil ] 
		 ];
	}
	else
	{
		NSLog(@"------- Wrong Type Animation -------");
	}
		NSLog(@"has Run Action: %@", name);

}

+(CCSprite*) spriteAnimationWithFramePattern:(NSString*)framePattern frameCount:(int)frameCount delay:(float)delay
{
	NSMutableArray* frames = [NSMutableArray arrayWithCapacity:frameCount];
	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
	
	// load the animation frames as textures and create a sprite frame 	
	for (int i = 1; i <= frameCount; i++ ) {
		NSString* frameName = [NSString stringWithFormat:framePattern, i];
		CCSpriteFrame* frame = [frameCache spriteFrameByName:frameName];
		[frames addObject:frame];
	}

	CCAnimation *animation =  [CCAnimation animationWithFrames:frames delay:delay];
	CCAnimate* animate = [CCAnimate actionWithAnimation:animation];
	CCRepeatForever* repeat = [CCRepeatForever actionWithAction:animate];

	CCSprite *sprite = [frameCache spriteFrameByName:[NSString stringWithFormat:framePattern, 1] ];
	[sprite runAction:repeat];

	return sprite;
}
#pragma mark static constructors

+(id) animAt:(float)time addSprite:(NSString*) aSpriteFrameName position:(CGPoint)aPosition opacity:(int)aOpacity
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time addSprite:aSpriteFrameName position:aPosition opacity:aOpacity ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time startAnimation:(NSString*)namePrefix  position:(CGPoint)aPosition frames:(int)numFrames interval:(float)aInterval
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time startAnimation:namePrefix  position:aPosition frames:numFrames interval:aInterval ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time fadeIn:(NSString*) spriteName interval:(float)aInterval
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time fadeIn:spriteName interval:aInterval ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time fadeOut:(NSString*) spriteName interval:(float)aInterval
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time fadeOut: spriteName interval:aInterval ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time playSound:(NSString*) soundFile
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time  playSound:soundFile ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time changeOpacity:(NSString*) spriteName opacity:(int)newOpacity
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time changeOpacity:spriteName opacity:newOpacity ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time showParticules:(NSString*) afileName
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time showParticules: afileName ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time accelerateBy:(CGPoint) acceleration sprite:(NSString*) spriteName
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time accelerateBy:acceleration sprite:spriteName ];
	[ animation autorelease ];
	return animation;
}

+(id) animAt:(float)time changeSprite:(NSString*) spriteName toSpriteFrame:(NSString*) newSpriteFrameName
{
	Animation *animation = [Animation alloc];
	[ animation initAt:time changeSprite:spriteName toSpriteFrame:newSpriteFrameName ];
	[ animation autorelease ];
	return animation;
}


#pragma mark constructors

-(id) initAt:(float)time addSprite:(NSString*) aSpriteFrameName position:(CGPoint)aPosition opacity:(int)aOpacity
{
	self = [super init];
	
	damagePercent = time;
	type = @"addSprite";
	name  = aSpriteFrameName;
	spriteFrameName = aSpriteFrameName;
	opacity = aOpacity;
	position = aPosition;
	
	return self;
}

-(id) initAt:(float)time startAnimation:(NSString*)namePrefix  position:(CGPoint)aPosition frames:(int)numFrames interval:(float)aInterval
{
	self = [super init];
	
	damagePercent = time;
	type = @"startAnimation";
	name  = namePrefix;
	spriteFrameName = namePrefix;
	count = numFrames;
	interval = aInterval;
	position = aPosition;
	
	return self;
}

-(id) initAt:(float)time fadeIn:(NSString*) spriteName interval:(float)aInterval
{
	self = [super init];
	
	damagePercent = time;
	type = @"fadeIn";
	name  = spriteName;
	interval = aInterval;
	
	return self;
}

-(id) initAt:(float)time fadeOut:(NSString*) spriteName interval:(float)aInterval
{
	self = [super init];
	
	damagePercent = time;
	type = @"fadeOut";
	name  = spriteName;
	interval = aInterval;
	
	return self;
}

-(id) initAt:(float)time playSound:(NSString*) soundFile
{
	self = [super init];
	
	damagePercent = time;
	type = @"playSound";
	fileName = soundFile;
	
	return self;
}

-(id) initAt:(float)time changeOpacity:(NSString*) spriteName opacity:(int)newOpacity
{
	self = [super init];
	
	damagePercent = time;
	type = @"changeAlpha";
	name  = spriteName;
	opacity = newOpacity;
	
	return self;
}

-(id) initAt:(float)time showParticules:(NSString*) afileName
{
	self = [super init];
	
	damagePercent = time;
	type = @"particle";
	fileName = afileName;
	
	return self;
}

-(id) initAt:(float)time accelerateBy:(CGPoint) acceleration sprite:(NSString*) spriteName
{
	self = [super init];
	
	damagePercent = time;
	type = @"accelerateBy";
	name  = spriteName;
	
	return self;
}

-(id) initAt:(float)time changeSprite:(NSString*) spriteName toSpriteFrame:(NSString*) newSpriteFrameName
{
	self = [super init];
	
	type = @"changeSprite";
	name = spriteName;
	spriteFrameName = newSpriteFrameName;
	
	return self;
}

@end

/*******************************
 Accelerate Action
 *******************************/

@implementation AccelerateMotion

+(id) actionWithDuration:(ccTime) t initialSpeed:(CGPoint) iSpeed acceleration:(CGPoint) a rotationSpeed:(float) aRotSpeed
 {	
	 return [[[self alloc] initWithDuration:t initialSpeed:iSpeed acceleration:a rotationSpeed:aRotSpeed] autorelease];
 }
 
 -(id) initWithDuration: (ccTime) t initialSpeed:(CGPoint)iSpeed acceleration:(CGPoint) a rotationSpeed:(float) aRotSpeed
 {
	 self = [super initWithDuration: t];
	 
	 speed = iSpeed ;
	 acceleration = a;
	 rotSpeed = aRotSpeed;
	 return self;
 }
 
 -(id) copyWithZone: (NSZone*) zone
 {
	 CCAction *copy = [[[self class] allocWithZone: zone] initWithDuration:[self duration] initialSpeed:speed acceleration:acceleration ];
	 return copy;
 }
 
 -(void) startWithTarget:(CCNode *)aTarget
 {
	 [super startWithTarget:aTarget];
 }
 
 -(CCActionInterval*) reverse
 {
 return [[self class] actionWithDuration:duration_ 
							initialSpeed:ccp( -speed.x, -speed.y)
							acceleration:ccp( -acceleration.x, -acceleration.y) ];
 }

-(void) update:(ccTime)time
{
	float dt = (time - delta) * duration_ ;
	speed.x += acceleration.x * dt;
	speed.y += acceleration.y * dt;
	
	CGPoint currPosition = [(CCNode*)target_ position];
	currPosition.x += speed.x*dt; // + acceleration.x*( dt*2*elapsed_ - pow(dt,2) )/2;
	currPosition.y += speed.y*dt; // + acceleration.y*( dt*2*elapsed_ - pow(dt,2) )/2;
	CCNode *node = (CCNode*)target_;
	
	[node setPosition:currPosition];
	node.rotation += rotSpeed * dt;

	delta = time;
}

@end

@implementation ShowParticleSystem

@synthesize particleSystem;

-(id) initWithParticleSys:(CCParticleSystem*)aParticleSystem updatePosition:(BOOL) isUpdatePosition
{
	if (self = [super initWithDuration: aParticleSystem.duration] ) {
		self.particleSystem = aParticleSystem;
		updatePosition = isUpdatePosition;
	}
	return self;
}

+(id) actionWithParticleSys:(CCParticleSystem*)aParticleSystem updatePosition:(BOOL) isUpdatePosition
{
	ShowParticleSystem *action = [[[ShowParticleSystem alloc] initWithParticleSys:aParticleSystem 
																   updatePosition:isUpdatePosition] autorelease];
	return action;
}

-(void) update:(ccTime)time
{
	CCNode* node = (CCNode*)target_;
	
	if (firstTick_ && particleSystem.parent == nil) {
		if (updatePosition) {
			particleSystem.positionType=kCCPositionTypeFree;
		}
		[node.parent addChild:particleSystem z:50];
	}
	
	if (updatePosition){
		particleSystem.position = node.position;
	}

}

-(void) dealloc
{
    [particleSystem release];
    [super dealloc];
}
@end

@implementation PlayEffect

+(id) actionWithFile:(NSString *)fileName
{
	PlayEffect* action = [[[PlayEffect alloc] initWithFile:fileName] autorelease];
	return action;
}

-(id) initWithFile:(NSString *)fileName
{
		if (self = [super initWithDuration:0] ) {
			sndEffect = [fileName retain];
		}
		return self;
}

-(void) update:(ccTime)time
{
	if (firstTick_) {
		[[SimpleAudioEngine sharedEngine] playEffect:sndEffect];
	}
}

-(void) dealloc
{
    [sndEffect release];
    [super dealloc];
}

@end


#pragma mark CCExploteTiles

@implementation CCExploteTiles

+(id)actionWithSeed:(int)s grid:(ccGridSize)gridSize duration:(ccTime)d
{
	return [[[self alloc] initWithSeed:s grid:gridSize duration:d] autorelease];
}

-(id)initWithSeed:(int)s grid:(ccGridSize)gSize duration:(ccTime)d
{
	if ( (self = [super initWithSize:gSize duration:d]) )
	{
		seed = s;
		tilesOrder = nil;
		tiles = nil;
	}
	
	return self;
}

-(id) copyWithZone: (NSZone*) zone
{
	CCGridAction *copy = [[[self class] allocWithZone:zone] initWithSeed:seed grid:gridSize_ duration:duration_];
	return copy;
}


-(void)dealloc
{
	if ( tilesOrder ) free(tilesOrder);
	if ( tiles ) free(tiles);
	[super dealloc];
}

-(void)shuffle:(int*)array count:(int)len
{
	int i;
	for( i = len - 1; i >= 0; i-- )
	{
		int j = rand() % (i+1);
		int v = array[i];
		array[i] = array[j];
		array[j] = v;
	}
}

-(ccGridSize)getDelta:(ccGridSize)pos
{
	CGPoint	pos2;
	int idx = pos.x * gridSize_.y + pos.y;
	
	pos2.x = tilesOrder[idx] / (int)gridSize_.y;
	pos2.y = tilesOrder[idx] % (int)gridSize_.y;
	
	//return ccg(pos2.x - pos.x, pos2.y - pos.y);
	return ccg( (rand() % 40)-20,  -(rand() % 80)*4 -100);
}

-(void)placeTile:(ccGridSize)pos tile:(Tile)t
{
	ccQuad3	coords = [self originalTile:pos];
	
	CGPoint step = [[target_ grid] step];
	coords.bl.x += (int)(t.position.x * step.x);
	coords.bl.y += (int)(t.position.y * step.y);
	
	coords.br.x += (int)(t.position.x * step.x);
	coords.br.y += (int)(t.position.y * step.y);
	
	coords.tl.x += (int)(t.position.x * step.x);
	coords.tl.y += (int)(t.position.y * step.y);
	
	coords.tr.x += (int)(t.position.x * step.x);
	coords.tr.y += (int)(t.position.y * step.y);
	
	[self setTile:pos coords:coords];
}

-(void)startWithTarget:(id)aTarget
{
	[super startWithTarget:aTarget];
	
	if ( seed != -1 )
		srand(seed);
	
	tilesCount = gridSize_.x * gridSize_.y;
	tilesOrder = (int*)malloc(tilesCount*sizeof(int));
	int i, j;
	
	for( i = 0; i < tilesCount; i++ )
		tilesOrder[i] = i;
	
	//[self shuffle:tilesOrder count:tilesCount];
	
	tiles = malloc(tilesCount*sizeof(Tile));
	Tile *tileArray = (Tile*)tiles;
	
	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			tileArray->position = ccp(i,j);
			tileArray->startPosition = ccp(i,j);
			tileArray->delta = [self getDelta:ccg(i,j)];
			tileArray++;
		}
	}
}

-(void)update:(ccTime)time
{
	int i, j;
	
	Tile *tileArray = (Tile*)tiles;
	
	for( i = 0; i < gridSize_.x; i++ )
	{
		for( j = 0; j < gridSize_.y; j++ )
		{
			tileArray->position = ccpMult( ccp(tileArray->delta.x, tileArray->delta.y), pow(time,2));
			[self placeTile:ccg(i,j) tile:*tileArray];
			tileArray++;
		}
	}
}


@end


@implementation Remove

+(id) action
{
    id action = [[[Remove alloc] init] autorelease]; 
	return action;
}

-(id) init
{
    if (self = [super initWithDuration:0] ) {

    }
    return self;
}

-(void) update:(ccTime)time
{
	if (firstTick_) {
        CCNode *node = target_;
        [node.parent removeChild:node cleanup:YES];
	}
}
@end
