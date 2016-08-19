//
//  UserTracking.m
//  iNigma
//
//  Created by Francisco Padilla on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserTracking.h"
#import "FlurryAnalytics.h"
#import "ASTStoreController.h"

@implementation UserTracking

static 	UserTracking *sharedUserTracking;

-(id) init {
	self = [super init]; {
        /*
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
        logFilePath = [[[paths objectAtIndex:0] stringByAppendingPathComponent:@"userTracking"] retain];
        sendingFilePath = [[logFilePath stringByAppendingString:@".sending"] retain];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:logFilePath]) {
            [@"" writeToFile:logFilePath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        } 
        
        [self sendData];        
        dataFile = [[NSFileHandle fileHandleForUpdatingAtPath:logFilePath ] retain];
        [dataFile seekToEndOfFile]; */
        
        events = [[NSArray arrayWithObjects:@"UseApp",@"UseApp",@"Play",@"Play",@"Pause",@"Resume",@"Fail Send", nil] retain];
    }
	return self;
}

-(void) dealloc
{
	[dataFile closeFile];
    [logFilePath release];
    [sendingFilePath release];
	[super dealloc];
	[dataFile release];
}

+(UserTracking*) sharedUserTracking
{
	if( sharedUserTracking == nil) {
		sharedUserTracking = [[[UserTracking alloc] init] retain];
	}
	return sharedUserTracking;
}

-(void) sendData
{
    NSString *stringData;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:sendingFilePath]) { // old or pending for send file
        stringData = [NSString stringWithContentsOfFile:sendingFilePath encoding:NSUTF8StringEncoding error:NULL];
        //NSLog(@"------->>>>>>>> Sending pending/failed file");
	} else {
        // no pending file so try send primary file.
        stringData = [NSString stringWithContentsOfFile:logFilePath encoding:NSUTF8StringEncoding error:NULL];
        if ( stringData.length == 0 ) {
            return; // not enough data for send
        } else { // rotate files 
            [stringData writeToFile:sendingFilePath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
            [[NSFileManager defaultManager] createFileAtPath:logFilePath contents:NULL attributes:NULL];
            //NSLog(@"------->>>>>>>> Files Rotated");
        }
    }
    
    
    NSString * encodedData = (NSString*)CFURLCreateStringByAddingPercentEscapes(NULL,
                                            (CFStringRef) stringData,
                                            NULL,
                                            (CFStringRef) @"!*'();:@&=+$,/?%#[]\"\t\n",
                                            kCFStringEncodingUTF8);

	NSURL *url = [[NSURL alloc] initWithString:@"http://beatenigma.com/usrStats/userStatistics.php"];	
	NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
	//[url release];
    
	[urlRequest setHTTPMethod:@"POST"];
    NSString *httpBodyString = [NSString stringWithFormat:@"uuid=%@&data=%@", [UIDevice currentDevice].identifierForVendor, encodedData ];
	[urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding] ] ;
	//[httpBodyString release];
    recvData = [[NSMutableData data] retain];
	
	connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
	
	if (!connection)
	{
		//NSLog(@"***********************Failed to submit request");
	}
	
    return;
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [recvData appendData:data];
    //NSLog(@"User Statistics Data did receive");
}

-(void) connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    [recvData release];
    recvData = nil;
    connection = nil;
    [sharedUserTracking Log:FAIL_SEND ];
    //NSLog(@"User Statistics Data Error Sending");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str = [[NSString alloc] initWithData:recvData encoding:NSUTF8StringEncoding];
    if ([@"success" isEqualToString:str]) {
        //NSLog(@"User Statistics Data was sent");
    }
    
    [[NSFileManager defaultManager ]removeItemAtPath:sendingFilePath error:NULL];
    [recvData release];
    
}

-(void) Log:(int)event points:(int)pts phase:(int)phase time:(float)t
{
	/* NSString *dataString = [NSString stringWithFormat:@"%@\t%i\t%i\t%i\n", 
                      [self getTimeStamp], event, pts, phase];
					
	[dataFile writeData:[dataString dataUsingEncoding:NSUTF8StringEncoding]];	*/

     NSString *eventString = (NSString*) [events objectAtIndex:event];
    if (event == END_PLAY) {
        NSDictionary *params = 
        [NSDictionary dictionaryWithObjectsAndKeys:
         [NSString stringWithFormat:@"%i", pts], @"points", 
         [NSString stringWithFormat:@"%i", phase], @"phase", 
         nil];
        [FlurryAnalytics endTimedEvent:eventString withParameters:params];
    } else {
        [FlurryAnalytics logEvent:eventString ];
    }

}

-(void) Log:(int)event
{
	 /*NSData *data = [[NSString stringWithFormat:@"%@\t%i\n", 
					   [self getTimeStamp],
					  event]
					 dataUsingEncoding:NSUTF8StringEncoding ];
	[dataFile writeData:data];*/
    
    NSString *eventString = (NSString*) [events objectAtIndex:event];
    
    if (event == START_PLAY) {
        [FlurryAnalytics logEvent:eventString timed:YES];
    } else {
        [FlurryAnalytics logEvent:eventString ];
    }
    
}

-(void) logEvent:(int)eventName
{
    [FlurryAnalytics logEvent:eventName ];
}


-(NSString *)getTimeStamp
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"Y-MM-dd HH:mm:ss\tz"];
    NSDate *now = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:now ];
    NSDate *control = [dateFormatter dateFromString:dateString];
    [dateFormatter release];
    return dateString;
}


-(BOOL) addCoins:(int)coins withSubject:(NSString*) subject
{
    NSUserDefaults *usrPrefs = [NSUserDefaults standardUserDefaults];
    int total = [usrPrefs integerForKey:@"coinCount"];
    if (coins >0 && total + coins < 0) {
        return NO;
    }
    [usrPrefs setInteger:total+coins forKey:@"coinCount"];
    [usrPrefs synchronize];
    NSLog(@"Add %i coins: %@", coins, subject);
    NSLog(@"Total coins: %i", total + coins);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CoinCountChanged" object:self userInfo:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:total+coins] forKey:@"newCoinCount"]];
    
    
    return YES;
}

-(int) coinCount
{
    NSUserDefaults *usrPrefs = [NSUserDefaults standardUserDefaults];
    if ([usrPrefs objectForKey:@"coinCount"] == nil) {
        [usrPrefs setInteger:1500 forKey:@"coinCount"];
        [usrPrefs synchronize];
        return 1500;
    }
    int total = [usrPrefs integerForKey:@"coinCount"];
    return total;
}

-(BOOL) hasPowerUp:(NSString*)powerUp
{
    NSUserDefaults *usrPrefs = [NSUserDefaults standardUserDefaults];
    if ([usrPrefs objectForKey:powerUp] != nil &&
        [usrPrefs boolForKey:powerUp]) {
        return true;
    } else
        return false;

}

-(void) addPowerUp:(NSString*)powerUp
{
    NSUserDefaults *usrPrefs = [NSUserDefaults standardUserDefaults];
    [usrPrefs setBool:YES forKey:powerUp];
    [usrPrefs synchronize];
}

@end
