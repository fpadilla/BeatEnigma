//
//  RewardEngine.m
//  iNigma
//
//  Created by Francisco Padilla on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RewardEngine.h"

#pragma mark PointEvent

@implementation PointEvent

@synthesize points, delta;

+(PointEvent *) pointEventWithInput:(int) points delta:(NSTimeInterval) dt
{
    PointEvent *pointEvent = [[PointEvent alloc] initWithInput:points delta:dt];
    return pointEvent;
}

-(PointEvent *) initWithInput:(int) Points delta:(NSTimeInterval) dt
{
    if (self  = [super init]) {
        points = Points;
        delta  = dt;
    }
    return  self;
}

@end

#pragma mark -
#pragma mark RewardRule 

@implementation RewardRule

@synthesize ratio, vratio, accumulate;

+(RewardRule*) ruleWithRatio:(int) r vratio:(int)vr block:(void(^)(id)) block
{
    RewardRule *rule = [[[RewardRule alloc] initWithRatio:r vratio:vr block:block] autorelease];
    return rule;
}

-(RewardRule*) initWithRatio:(int)r vratio:(int)vr block:(void(^)(id)) block
{
    if (self = [self initWithRatio:r block:block]) {
        vratio = vr;
    }
    return self;
}


+(RewardRule*) ruleWithRatio:(int)r block:(void(^)(id))block
{
    return [[RewardRule alloc] initWithRatio:(int)r block:block];
}


-(RewardRule*) initWithRatio:(int)r block:(void(^)(id))block
{
    if (self = [super init]) {
        ratio = r;
        vratio = 0;
        self.callback = block;
    }
    return self;
}

-(BOOL) execute:(RewardEngine *) engine
{
    float input = [engine inputTotal];
    if ( input > accumulate + currRatio && callback != nil) {
        accumulate += ratio;
        callback(engine);
        currRatio = ratio + vratio ? arc4random() % (vratio+1) : 0;
        return TRUE;
    }
    return FALSE;
}

-(void) setCallback:(RuleBlock)block
{
    callback = [block copy];
}

-(RuleBlock) callback
{
    return callback;
}

-(void) dealloc
{
    [super dealloc];
    [callback release];
}

@end

#pragma mark -
#pragma mark SpeedRule

@implementation SpeedRule

+(SpeedRule*) ruleWithRatio:(int)r block:(void(^)(id)) block
{
    SpeedRule *rule = [[[SpeedRule alloc] initWithRatio:r block:block] autorelease];
    return rule;
}

-(SpeedRule*) initWithRatio:(int)r block:(void(^)(id)) block
{
    if (self = [super initWithRatio:r block:block] ) {
        
    } 
    return  self;
}


-(BOOL) execute:(RewardEngine *) engine
{
    float speed = 0;
    BOOL result = FALSE;
    for (PointEvent *pe in engine.pointEvents) {
        if (pe.delta >= accumulate && pe.delta > engine.elapsedTime - 1) {
            speed += pe.points;
        }
        if (speed > ratio) {
            callback(engine);
            accumulate = pe.delta;
            result = TRUE;
            // NSLog(@"+++++ speed %f _____Rewarded_____", speed);
            speed -= ratio;
        }
    }
    //NSLog(@"+++++ speed %f ", speed);
    return result;
}

@end

#pragma mark -
#pragma mark RewardEngine

@implementation RewardEngine

@synthesize speed, inputTotal, pointEvents, elapsedTime;

static RewardEngine *sharedInstance; 

+(RewardEngine*) sharedInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[RewardEngine alloc] init];
        [sharedInstance retain];
    }
    return sharedInstance;
}

-(RewardEngine*) init
{
    NSAssert(sharedInstance == nil, @"Reward Engine double instance of singleton");
    if (self = [super init]) {
        elapsedTime = 0;
        inputTotal = 0;
        rules = [[[NSMutableArray alloc] initWithCapacity:10] retain];
        pointEvents = [[NSMutableArray  arrayWithCapacity:10] retain];
    }
    [[CCScheduler sharedScheduler] scheduleUpdateForTarget:self priority:0 paused:NO];
    return self;
}
    
-(void) dealloc
{
    [super dealloc];
    [rules release];
    [pointEvents release];
}

-(void) update:(ccTime) dt
{
    elapsedTime += dt;
    //[self calculateSpeed];
}

-(void) reset
{
    [pointEvents removeAllObjects];
}

-(void) calculateSpeed 
{
    // delete old events
    NSTimeInterval interval = 1; // 1 sec
    int deleteIndex = 0;
    for (PointEvent *pointEvent in pointEvents) {
        if ( pointEvent.delta < elapsedTime - interval ) {
            deleteIndex++;
        }
    }
    if (deleteIndex > 0 ) {
        [pointEvents removeObjectsInRange:NSMakeRange(0, deleteIndex)];
    }
    
    // calculate speed 
    speed = 0;
    for (PointEvent *pointEvent in pointEvents) {
        speed += pointEvent.points;
    }    
    speed = speed/interval;
    //NSLog(@"RewarsEngine speed: %f", speed);
}


-(void) addInput:(int)input
{
    inputTotal += input;
    //NSLog(@"new input: %i", input);
    
    PointEvent *pointEvent = [PointEvent pointEventWithInput:input delta:elapsedTime];
    [pointEvents addObject: pointEvent];
    [self calculateSpeed];
    
    //[rules makeObjectsPerformSelector:@selector(execute:) withObject:self ];
     for( RewardRule *rule in rules){
         [rule execute:self];
     }
    
}

-(void) addRule:(RewardRule *)rule
{
    [rules addObject:rule];
}

-(void) removeRule:(RewardRule *)rule
{
    [rules removeObject:rule];
}

-(void) removeAllRules
{
    [rules removeAllObjects];
}

@end
