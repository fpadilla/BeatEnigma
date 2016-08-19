//
//  RewardEngine.h
//  iNigma
//
//  Created by Francisco Padilla on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#pragma mark RewardRule

typedef void (^RuleBlock)(id);

@class RewardEngine;

@interface RewardRule : NSObject{
    int ratio;
    int vratio;
    int currRatio;
    int accumulate;
    RuleBlock callback;
}

@property int ratio;
@property int vratio;
@property(readonly) int accumulate;
@property(retain) RuleBlock callback;

+(RewardRule*) ruleWithRatio:(int)r vratio:(int)vr block:(void(^)(id)) block;
-(RewardRule*) initWithRatio:(int)r vratio:(int)vr block:(void(^)(id)) block;

+(RewardRule*) ruleWithRatio:(int)r block:(void(^)(id)) block;
-(RewardRule*) initWithRatio:(int)r block:(void(^)(id)) block;

-(void) dealloc;

-(BOOL) execute:(RewardEngine *) engine;
-(void) calculateSpeed;

@end

#pragma mark -
#pragma mark SpeedRule

@interface SpeedRule: RewardRule {

}
+(SpeedRule*) ruleWithRatio:(int)r block:(void(^)(id)) block;
-(SpeedRule*) initWithRatio:(int)r block:(void(^)(id)) block;
-(BOOL) execute:(RewardEngine *) engine;

@end

#pragma mark -
#pragma mark Point Event

@interface PointEvent : NSObject {
    int points;
    NSTimeInterval delta;
}

@property int points;
@property NSTimeInterval delta;

+(PointEvent *) pointEventWithInput:(int) points  delta:(NSTimeInterval) dt;
-(PointEvent *) initWithInput:(int) points delta:(NSTimeInterval) dt;

@end

#pragma mark -
#pragma mark Reward Engine

@interface RewardEngine : NSObject{
    NSMutableArray *pointEvents;
    NSMutableArray *rules;
    NSTimeInterval elapsedTime;
    float speed;
    int inputTotal;
}

@property(readonly) float speed ;
@property(readonly) NSArray *pointEvents;
@property int inputTotal;
@property (readonly) NSTimeInterval elapsedTime;

+(RewardEngine*) sharedInstance;

-(RewardEngine*) init;
-(void) update:(ccTime) dt;
-(void) addInput:(int)input;
-(void) removeAllRules;
-(void) addRule:(RewardRule *) rule;
-(void) removeRule:(RewardRule *) rule;
-(void) reset;

@end
