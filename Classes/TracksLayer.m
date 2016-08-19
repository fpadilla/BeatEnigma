//
//  TracksLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "TracksLayer.h"
#import "PopupLayers.h"
#import "iNigmaAppDelegate.h"
#import "RewardEngine.h"

@implementation TracksLayer

@synthesize tracks;
@synthesize minSpeed;
@synthesize pausedTime; 
@synthesize status;
@synthesize trackWidth;
@synthesize symbolIndex;
@synthesize isRunning;
@synthesize timeFactor;
@synthesize mineCount;

// initialize your instance here
-(id) init
{
	if (self=[super init]) {
        timeFactor = 1;
        spriteSize = CGSizeMake(57, 51);
    }

	return self;
}

- (id)initWithParameters: (NSMutableDictionary *)parameters
{
    timeFactor = 1;
    spriteSize = CGSizeMake(57, 51);

	tracksMarginTop = 50;
	trackWidth = 57;
	endSymbols = NO;
    
	NSString *devOrientation = @"landscape";
	BOOL isPortraitOrientation = NO;
	
	if ([[parameters objectForKey:@"portraitOrientation"] intValue] == 1 ) { // Default orientation is landscape
		isPortraitOrientation = YES;
		devOrientation = @"portrait";
	}
	
	rows = [[parameters objectForKey:@"rows"] intValue];
	
	if( (self=[super init])) {	
        timeFactor = 1;
		CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
		CGSize screenSize = [[CCDirector sharedDirector] winSize ];

		// create tracks
		NSArray *tracksParams = [parameters objectForKey:@"tracks"];
		self.tracks = [[NSMutableArray alloc] initWithCapacity:[tracksParams count]];
		tracksMarginLeft = ( screenSize.width - trackWidth * [tracksParams count] ) / 2 + 1;
		int col = 0;
		for( NSDictionary *trackParams in tracksParams){
			Track *track = [[Track alloc] initWithLayer:self position:CGPointMake(tracksMarginLeft + trackWidth * col, tracksMarginTop)];
			
			track.speed = [[ trackParams objectForKey:@"speed"] floatValue ];
			track.pausedTime = [[ trackParams objectForKey:@"pausedTime"] floatValue ];
			track.disacceleration = [[ trackParams objectForKey:@"disacceleration"] floatValue ];
			track.maxSpeed = [[ trackParams objectForKey:@"maxSpeed"] floatValue ];
			track.accelerometerSensibility = [[ trackParams objectForKey:@"accelerometerSensibility"] floatValue ];
			track.rows = rows;
			track.trackWidth = trackWidth;
			
			if ([ trackParams objectForKey:@"symbols"] != nil ) {
				track.symbols = [Symbol symbolArrayFromString:[ trackParams objectForKey:@"symbols"] ];
			}
			
			[track autorelease];
			[tracks addObject: track ];
			col++;
		}
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
		[[UIAccelerometer sharedAccelerometer] setUpdateInterval: (1.0 / 30)];
		[self scheduleUpdates];
		isRunning = YES;
	}	
	
	return self;
}

-(void) dealloc
{
    [tracks release];
    
}

#pragma mark schedules

-(void) scheduleUpdates
{
	[self scheduleUpdate];
}

-(void) update:(ccTime) dt
{
	if ( !isRunning && paused){
		return;
	}

	if ( !paused ) { // running
		BOOL isAllPaused = YES;
		for (Track *track in self.tracks) {
			[track update: dt*timeFactor];
			isAllPaused = isAllPaused && (track.status == PAUSED);
		}

		if ( isAllPaused ) {
			pausedTimeInterval = pausedTime;
			paused = true;
            symbolIndex++;
			
            if ( newSpeeds != nil ) { [self changeSpeeds]; }
			if ( newSpeed != 0 ) { [self changeSpeed ]; }
            if ( resetIndex ) { [self setTracksIndex:0]; resetIndex = FALSE ;}
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TRACK_PAUSE" object:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"END_TRACK_PAUSE" object:nil];
            
            [[RewardEngine sharedInstance] calculateSpeed];
            float newTrackPause =  1.5 - [[RewardEngine sharedInstance] speed] / 18;
            pausedTime += (newTrackPause-pausedTime)*0.333;
            pausedTime = pausedTime>0 ? pausedTime : 0;
            
            [self countMines];
		}
	} else {
		pausedTimeInterval -= dt;
		if( pausedTimeInterval <= 0) {
			paused = false;
			for (Track *track in tracks) {
				track.status = RUNING;
			}
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TRACK_RUNNING" object:nil];
		}
	}
}

-(void) waves:(float)time;
{
	[self stop];
	[self setOpacity: 90];
    float rippleTime = 1.5f;
	
	id ripple = [CCRipple3D actionWithPosition:ccp(240,160) radius:300 waves:1 amplitude:50 grid:ccg(50,40) duration:rippleTime];
	
	[self runAction:[CCSequence actions: 
					 ripple
					 ,[CCStopGrid action] 
					 ,[CCDelayTime actionWithDuration:time-rippleTime]
					 ,[CCCallFunc actionWithTarget:self selector:@selector(run)]
					 ,nil ] ];
	
}	

-(void) accelerometer:(UIAccelerometer *)accelerometer	didAccelerate:(UIAcceleration *)acceleration
{	
	for (Track *track in self.tracks) {
		float gravity = sqrt( pow(acceleration.x,2) + pow(acceleration.y,2) + pow(acceleration.z,2) );
		if (track.accelerometerSensibility != 0 && gravity > 1.5 ) {
			if (track.maxSpeed > 0 ) {
				track.speed += track.accelerometerSensibility * fabs(gravity);
			}else if (track.maxSpeed < 0 ) {
				track.speed -= track.accelerometerSensibility * fabs(gravity);
			}
			
			CCLOG(@"speed of track accelerated by %f current speed %f", 
				  track.accelerometerSensibility * fabs(gravity),
				  track.speed );
		}
	}
}

#pragma mark utilities


-(void) setTracksIndex:(int) index
{
	for (Track *track in self.tracks) {
		track.index = index;
	}
}

-(void) setOpacity:(int)newOpacity
{
	for (Track *track in self.tracks) {
		for (CCSprite *sprite in track.sprites) {
			sprite.opacity = newOpacity;
		}
	}
}

-(void) stop
{
	isRunning = NO;
}

-(void) run
{
	isRunning = YES;
}

-(void) setSpeeds:(NSArray *)speeds
{
	newSpeeds = [speeds retain];
	
	// search for minimun Speed speeds are changed on next PAUSED state see changeSpeeds
	int i = 0;
	minSpeed = 1000.0f;
	for (Track *track in tracks) {
		float currrentSpeed = [[newSpeeds objectAtIndex:i++] floatValue];
		if ( minSpeed > fabs(currrentSpeed) ) {
			minSpeed = fabs(currrentSpeed) ;
		}
	}
}


-(void) changeSpeeds
{
	int i = 0;
	for (Track *track in tracks) {
		float speed = [[newSpeeds objectAtIndex:i]floatValue];
        i++;
		track.speed =  fabs(speed) * track.speed/fabs(track.speed);
	}
	[newSpeeds release];
	newSpeeds = nil;
}


-(void) setSpeed:(float)speed
{
	newSpeed = speed;
	minSpeed = newSpeed;
}

-(void) changeSpeed
{
	for (Track *track in tracks) {
		track.speed = sign(track.speed)*abs(newSpeed); 
	}
	newSpeed = 0;
}

-(float) minSpeed
{
	return minSpeed;
}

-(void) reset
{
    BOOL isAllPaused = YES;
    for (Track *track in self.tracks) {
        isAllPaused = isAllPaused && (track.status == PAUSED);
    }
    
    if (isAllPaused){
        [self setTracksIndex:0];
    } else {
        resetIndex = TRUE;        
    }
    [self resetIsPerfectLevel];
}

// used by Laser class for location neightbors 
-(SymbolSprite*) getSymbolSprite4location:(CGPoint) location
{
    //spriteSize = CGSizeMake(57, 51);
    int trackIndex = 0;
    float padding = 0;
	for( Track *track  in self.tracks ){
        trackIndex ++;
		for (SymbolSprite *sprite in track.sprites) {
			if ( CGRectContainsPoint( CGRectMake(sprite.position.x - track.trackWidth/2 + padding, 
												 sprite.position.y - spriteSize.height/2 + padding, 
												 track.trackWidth-padding, 
												 spriteSize.height-padding)
									 , location) ){
                //NSLog(@"Found sprite %@ at location %f,%f", sprite, location.x, location.y);
                    return sprite;                    
			} //if contain point
		}// for sprites
	} // for track
    //NSLog(@"sprite not found at location %f,%f", location.x, location.y);
	return nil;
}

-(void) jokerRow:(SymbolSprite*) sprite
{
    float height = spriteSize.height;
    NSMutableArray *sprites = [NSMutableArray arrayWithCapacity:rows];

    for (Track *track in tracks) {
        for (SymbolSprite *sp in track.sprites) {            
            if (sp.position.y - height/2 < sprite.position.y & 
                sprite.position.y < sp.position.y + height/2 &
                sp.symbol.character != sprite.symbol.character) {
                [sprites addObject:sp];
            }
        }
    }
    [[GameMechanics sharedGame] rewardSprites:sprites];
    for (SymbolSprite *sprite in sprites) {
        
        unichar character = sprite.symbol.character;
        if ( (character == 'O' || character == 'P' || 
            character == 'Q' || character == 'R') && sprite.symbol.enabled ) {
            continue;
        }
        
        if (sprite.symbol == [Symbol emptySymbol]) {
            sprite.symbol = [[Symbol alloc] initWithCharacter:'J'];
        } else {
            sprite.symbol.character = 'J';            
        }
        sprite.symbol.enabled = YES;
        [sprite updateSpriteFrame];        
    }
}

-(void) endSpecialSymbols
{
    if (endSymbols) {
        return;
    }
    
    NSMutableArray *sprites = [NSMutableArray arrayWithCapacity:rows];
    for (Track *track in tracks) {
        for (SymbolSprite *sp in track.sprites) {
            if ( (sp.symbol.character == 'O' || sp.symbol.character == 'P') && sp.symbol.enabled ) {
                    [sprites addObject:sp];
            }
        }
    }
    
    [[GameMechanics sharedGame] rewardSprites:sprites];
    endSymbols = YES;
}


-(int) countMines
{
    mineCount = 0;
	for (Track *track in tracks) {
        for (SymbolSprite*sprite in track.sprites) {
            if (sprite.symbol.character == 'M') {
                mineCount++;
            }
        }
	}
    return mineCount;
}

-(void) jokerMines
{
    mineCount = 0;
	for (Track *track in tracks) {
        for (SymbolSprite*sprite in track.sprites) {
            if (sprite.symbol.character == 'M') {
                sprite.symbol.character = 'J';
                [sprite updateSpriteFrame];
            }
        }
	}
    
}
-(void) jokerColumn:(SymbolSprite*) sprite
{
    float  width = spriteSize.width;
    NSMutableArray *sprites = [NSMutableArray arrayWithCapacity:rows];
    for (Track *track in tracks) {
        for (SymbolSprite *sp in track.sprites) {
            if ( sp.position.x - width/2 < sprite.position.x & 
                sprite.position.x < sp.position.x + width/2  &
                sp.symbol.character != sprite.symbol.character) {
                [sprites addObject:sp];
            }
        }
    }
    
    [[GameMechanics sharedGame] rewardSprites:sprites];
    for (SymbolSprite *sprite in sprites) {

        unichar character = sprite.symbol.character;
        if ( (character == 'O' || character == 'P' || 
              character == 'Q' || character == 'R') && sprite.symbol.enabled ) {
            continue;
        }

        if (sprite.symbol == [Symbol emptySymbol]) {
            sprite.symbol = [[Symbol alloc] initWithCharacter:'J'];
        } else {
            sprite.symbol.character = 'J';            
        }
        sprite.symbol.enabled = YES;
        [sprite updateSpriteFrame];        
    }
}

-(BOOL) isPerfectLevel
{
    BOOL perfectLevel = YES;
    for (Track* track in tracks) {
        perfectLevel = perfectLevel && track.isPerfectLevel;
    }
    return perfectLevel;
}

-(void) resetIsPerfectLevel
{
    for (Track* track in tracks) {
        track.isPerfectLevel = YES;
    }
}

@end
