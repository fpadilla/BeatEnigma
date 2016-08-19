//
//  UserTracking.h
//  iNigma
//
//  Created by Francisco Padilla on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	OPEN_APP = 0,
	CLOSE_APP = 1,
	START_PLAY = 2,
	END_PLAY = 3,
	PAUSE_PLAY = 4,
	RESUME_PLAY = 5,
    FAIL_SEND   = 6,
    PLAY = 7
} EventType;


@interface UserTracking : NSObject {
	NSFileHandle *dataFile;
    
    // Network stuff
    NSMutableData *recvData;
    NSURLConnection *connection;
    NSString *logFilePath;
        NSString *sendingFilePath;
    NSArray *events;
}
+(UserTracking*) sharedUserTracking;
-(void) sendData;
-(void) Log:(int)event points:(int)p phase:(int)phase time:(float)t;
-(void) Log:(int)event;
-(void) logEvent:(int)eventName;

-(BOOL) addCoins:(int)coins withSubject:(NSString*) subject;
-(int) coinCount;
-(BOOL) hasPowerUp:(NSString*)powerUp;
-(void) addPowerUp:(NSString*)powerUp;
@end
