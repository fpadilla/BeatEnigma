//
//  MainMenuLayer.m
//  iNigma
//
//  Created by Francisco Padilla on 3/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenuLayer.h"
#import "GameFlow.h"
#import "HelpPages.h"
#import "FBClient.h"
#import "Twitter.h"
#import "GameCenter.h"
#import "CreditsLayer.h"

@implementation MainMenuLayer

+(id)scene
{
	CCScene *scene = [CCScene node];
	MainMenuLayer *layer = [MainMenuLayer node];
	[scene addChild: layer];
	return scene;
}


- (id) init
{
    if ((self = [super init])) {
		
        rootViewController = [[[UIApplication sharedApplication] delegate] viewController];
        ccDeviceOrientation interfaceOrientation = [[CCDirector sharedDirector] deviceOrientation];
        if( interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
			// [[CCDirector sharedDirector] setDeviceOrientation: kCCDeviceOrientationLandscapeLeft]; 
		}
        
		self.isTouchEnabled = YES;
        
        // *******************************************

       	CCSpriteFrameCache* frameCache = [CCSpriteFrameCache sharedSpriteFrameCache]; 
        //[frameCache addSpriteFramesWithFile:@"main menu scene.plist"];
        
		CCSprite *background = [CCSprite spriteWithFile:@"mainMenuBackground.png"];
		[background setPosition:ccp(240,160)];
		[self addChild:background]; 

        // Particles
        CCParticleSystemPoint *particles1 = [CCParticleSystemQuad particleWithFile:@"symbol rain.plist"];
        particles1.autoRemoveOnFinish = YES; 
        //particles1.texture = [[CCTextureCache sharedTextureCache] addImage:@"mainMenuParticleSysTexture1.png"];
        [self addChild: particles1 z:0 tag:2011];

        CCParticleSystemPoint *particles2 = [CCParticleSystemQuad particleWithFile:@"symbol rain.plist"];
        particles2.autoRemoveOnFinish = YES;        
        particles2.texture = [[CCTextureCache sharedTextureCache] addImage:@"mainMenuParticleSysTexture2.png"];
        [self addChild: particles2 z:0 tag:2012];

        CCParticleSystemPoint *particles3 = [CCParticleSystemQuad particleWithFile:@"symbol rain.plist"];
        particles3.autoRemoveOnFinish = YES;        
        particles3.texture = [[CCTextureCache sharedTextureCache] addImage:@"mainMenuParticleSysTexture3.png"];
        [self addChild: particles3 z:0 tag:2013];
        
        CCParticleSystemPoint *particles4 = [CCParticleSystemQuad particleWithFile:@"symbol rain.plist"];
        particles4.autoRemoveOnFinish = YES;        
        particles4.texture = [[CCTextureCache sharedTextureCache] addImage:@"mainMenuParticleSysTexture4.png"];
        [self addChild: particles4 z:0 tag:2014];
        
        // for choose mode
        chooseModeBkg = [CCSprite spriteWithFile:@"modeMenu.png"];
        chooseModeBkg.position = ccp(240,170);
        chooseModeBkg.opacity = 0;
        [self addChild:chooseModeBkg];
        
        CCSprite *title = [CCSprite spriteWithSpriteFrameName:@"MainMenuTitle.png"];
        [title setPosition:ccp(240,290)];
		[self addChild:title];

#ifndef LITE_VERSION
        CCSprite *liteTitle = [CCSprite spriteWithSpriteFrameName:@"Pro.png"];
        int titlePosX = (480 - title.contentSize.width - liteTitle.contentSize.width)/2 + title.contentSize.width/2;
        [title setPosition:ccp( titlePosX, 290)];        
        
        [liteTitle setPosition:ccp( titlePosX + liteTitle.contentSize.width/2 + title.contentSize.width/2,290)];
		[self addChild:liteTitle];
#endif
        
        coinsLabel = [CCLabelBMFont labelWithString:@"" fntFile:@"Points Font.fnt"];
        coinsLabel.string = [NSString stringWithFormat:@"%i Coins", [[UserTracking sharedUserTracking] coinCount] ];
        coinsLabel.color = ccWHITE;
        coinsLabel.scale = 0.55;
        coinsLabel.position = ccp(240, title.position.y - 25);
        [self addChild:coinsLabel];
        
        CCMenuItemSprite *play = [CCMenuItemSprite
                                      itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"play-normal.png"]
                                      selectedSprite:[CCSprite spriteWithSpriteFrameName:@"play-selected.png"]
                                      disabledSprite:nil target:self selector:@selector(play:)
                                      ];

        float buttonLine = 25.0;
        
        play.position = ccp(240, 320+buttonLine);

#ifndef LITE_VERSION
#else
        /*CCMenuItemSprite *fullVersion = [CCMenuItemSprite
                                  itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"fullVersion.png"]
                                  selectedSprite:nil disabledSprite:nil target:self selector:@selector(fullVersion:)
                                  ];
        fullVersion.position = ccp(170, 171);
        play.position = ccp(360, 320+buttonLine);*/
#endif        

		[play runAction:[CCSequence actions:
                             [CCEaseOut actionWithAction:[CCMoveBy actionWithDuration:1 position:ccp(0,-(320+45-171))]  rate:2],
                             [CCRepeat actionWithAction:[CCSequence actions:[CCScaleTo actionWithDuration:1.5 scale:1.2],[CCScaleTo actionWithDuration:1 scale:0.9],nil] times:9000],
                             nil]];

        CCMenuItemSprite *feedback = [CCMenuItemSprite 
                                      itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"feedback-normal.png"]
                                      selectedSprite:[CCSprite spriteWithSpriteFrameName:@"feedback-selected.png"]
                                      target:self selector:@selector(buttonPressed:)
                                      ];
        feedback.position = ccp(120, buttonLine);
        
        CCMenuItemSprite *store = [CCMenuItemSprite
                                      itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"store-normal.png"]
                                      selectedSprite:[CCSprite spriteWithSpriteFrameName:@"store-selected.png"]
                                      target:self selector:@selector(showStore:)
                                      ];
        store.position = ccp(240 - store.contentSize.width/2, buttonLine);

        CCMenuItemSprite *help = [CCMenuItemSprite 
                                   itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"help-normal.png"]
                                   selectedSprite:[CCSprite spriteWithSpriteFrameName:@"help-selected.png"]
                                   target:self selector:@selector(help:)
                                   ];
        help.position = ccp(240 + help.contentSize.width/2, buttonLine);

        // music
        CCMenuItemImage *musicOn = [CCMenuItemSprite  
                                     itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"music-on.png"]
                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"music-off.png"]
                                    ];
        CCMenuItemImage *musicOff = [CCMenuItemSprite 
                                      itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"music-off.png"]
                                      selectedSprite:[CCSprite spriteWithSpriteFrameName:@"music-on.png"]
                                      ];
        
        CCMenuItemToggle *music = [[CCMenuItemToggle itemWithTarget:self 
										 selector:@selector(toggleMusic:) 
											items:musicOn,musicOff,nil ] retain];

        // sound
        CCMenuItemImage *soundOn = [CCMenuItemSprite 
                                     itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"effects-on.png"]
                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"effects-off.png"]
                                     ];
        CCMenuItemImage *soundOff = [CCMenuItemSprite 
                                     itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"effects-off.png"]
                                     selectedSprite:[CCSprite spriteWithSpriteFrameName:@"effects-on.png"]
                                     ];
        CCMenuItemToggle *sound = [[CCMenuItemToggle itemWithTarget:self 
										 selector:@selector(toggleSound:) 
                                            items:soundOn,soundOff,nil ] retain];
        sound.position = ccp(480 - 15 - sound.contentSize.width/2, buttonLine);
        music.position = ccp(480 - 15 - music.contentSize.width/2 - 8 - sound.contentSize.width, buttonLine);
        

        NSUserDefaults *usrDef = [NSUserDefaults standardUserDefaults];
        if( [usrDef objectForKey:@"sound"] != nil && [usrDef boolForKey:@"sound"] == NO ){
			sound.selectedIndex = 1;
        }
        
        if([usrDef objectForKey:@"music"] != nil && [usrDef boolForKey:@"music"] == NO ){
			music.selectedIndex = 1;
        }
        [[[CDAudioManager sharedManager] backgroundMusic] setNumberOfLoops:2];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"codebreaker.mp3"];
        if ([SimpleAudioEngine sharedEngine].backgroundMusicVolume > 0) {
            [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume:1.0];
        }
        

        [[[CDAudioManager sharedManager] backgroundMusic] setNumberOfLoops:2];


        
        // ------------ GAME CENTER ---------------

        gameCenter = [CCMenuItemSprite 
                                         itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"gameCenter-normal.png"]
                                         selectedSprite:[CCSprite spriteWithSpriteFrameName:@"gameCenter-selected.png"]
                                         target:self selector:@selector(gameCenter:)
                                         ];
        gameCenter.position = ccp(40, buttonLine);
        
        leaderBoard = [CCMenuItemSprite 
                                      itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"leaderBoard-normal.png"]
                                      selectedSprite:[CCSprite spriteWithSpriteFrameName:@"leaderBoard-selected.png"]
                                      target:self selector:@selector(leaderBoard:)
                                      ];
        leaderBoard.position = gameCenter.position ;
        leaderBoard.visible = NO;
        
        achievements = [CCMenuItemSprite 
                                         itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"achievements-normal.png"]
                                         selectedSprite:[CCSprite spriteWithSpriteFrameName:@"achievements-selected.png"]
                                         target:self selector:@selector(achievements:)
                                         ];
        achievements.position = gameCenter.position ;
        achievements.visible = NO;
        
        requestFriends = [CCMenuItemSprite 
                                         itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"requestFriends-normal.png"]
                                         selectedSprite:[CCSprite spriteWithSpriteFrameName:@"requestFriends-selected.png"]
                                         target:self selector:@selector(requestFriends:)
                                         ];
        requestFriends.position = gameCenter.position ;
        requestFriends.visible = NO;
        
        isGameCenterMenuHidden = YES;

        // add menu items
        CCMenu *menu = [CCMenu menuWithItems:play, feedback, store, help, music, sound,
                        leaderBoard, achievements, requestFriends, gameCenter, nil];
        [menu setPosition:ccp(0,-buttonLine) ];
        [menu runAction:[CCEaseOut actionWithAction:[CCMoveBy actionWithDuration:2 position:ccp(0,buttonLine)]  rate:2]];
        
        [self addChild:menu];
        
        // Show help it it's fist time
        if( [usrDef objectForKey:@"showHelp"] == nil || [usrDef boolForKey:@"showHelp"] == YES ){
            [self runAction: [CCSequence actions:
                              [CCDelayTime actionWithDuration:1.0]
                              ,[CCCallFuncN actionWithTarget:self selector:@selector(help:)]
                              , nil]
             ];
            [usrDef setBool:NO forKey:@"showHelp"];
            [usrDef synchronize];
        }    
    }
    
    [self schedule:@selector(updateCoinsLabel) interval:2.0];
              
    return self;
}

#pragma mark -
#pragma mark GameCenter 

-(void)gameCenter:(id)sender
{
    GameCenter *gc = [GameCenter sharedGameCenter];
    if ( [gc isGameCenterAPIAvailable ]  ){
        if (isGameCenterMenuHidden) {
            [self showGameCenterMenu];
            isGameCenterMenuHidden = NO;
        } else {
            [self hideGameCenterMenu];
            isGameCenterMenuHidden = YES;
        }
    } else {
        [[[UIAlertView alloc] initWithTitle:@"iOS 4.1 Required" message:@"Game Center requires iOS 4.1 or greater" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
}

-(void)leaderBoard:(id)sender
{
    [[GameCenter sharedGameCenter] showLeaderboard];
    [self gameCenter:sender];
}


-(void)achievements:(id)sender
{
    [[GameCenter sharedGameCenter] showAchievements];
    [self gameCenter:sender];
}


-(void)requestFriends:(id)sender
{
    [[GameCenter sharedGameCenter] showInviteFriends:nil];
    [self gameCenter:sender];
}

-(void) showGameCenterMenu
{
    [requestFriends runAction:[CCSequence actions:
                            [CCShow action],
                            [CCMoveBy actionWithDuration:0.25 position:ccp(0, 60)]
                            ,nil ]];
    
    /*[achievements runAction:[CCSequence actions:
                             [CCShow action],
                             [CCMoveBy actionWithDuration:0.25 position:ccp(0, 60*2)]
                             ,nil ]];*/
    [leaderBoard runAction:[CCSequence actions:
                            [CCShow action],
                            [CCMoveBy actionWithDuration:0.25 position:ccp(0, 60*2)]
                            ,nil ]];
}

-(void) hideGameCenterMenu
{
    [requestFriends runAction:[CCSequence actions:
                            [CCMoveBy actionWithDuration:0.25 position:ccp(0, -60)],
                            [CCHide action],
                            nil ]];
    /*[achievements runAction:[CCSequence actions:
                            [CCMoveBy actionWithDuration:0.25 position:ccp(0, -60*2)],
                            [CCHide action],
                            nil ]];*/
     [leaderBoard runAction:[CCSequence actions:
                             [CCMoveBy actionWithDuration:0.25 position:ccp(0, -60*2)],
                             [CCHide action],
                             nil ]];
}


#pragma mark -
#pragma mark other calls

-(void)twitter:(id)sender
{
    Class twitterControllerClass = (NSClassFromString(@"TWTweetComposeViewController"));
    //BOOL opened = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=BeatEnigma"]];
    if ( twitterControllerClass != NULL ) { // iOS 5
        if ( ! [[UIApplication sharedApplication] openURL:
                 [NSURL URLWithString:@"twitter://user?screen_name=BeatEnigma"]] ) {
            // [[Twitter sharedTwitterClient]  enableUpdatesFor:@"BeatEnigma"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http:mobile.twitter.com/BeatEnigma"]];
        }
    } else {
        [[Twitter sharedTwitterClient]  enableUpdatesFor:@"BeatEnigma"];
    }

}

-(void)facebook:(id)sender
{
    [[FBClient sharedFBClient] got2facebookApp];
}

-(void)about:(id)sender
{
	[CreditsLayer creditsLayer];
}

-(void)showStore:(id)sender
{
	[[GameFlow sharedGameFlow] showStore];
}

-(void)help:(id)sender
{
	[HelpPages showHelp:nil selector:nil];
}


-(void)toggleMusic:(CCMenuItemToggle *)sender
{
	[[GameFlow sharedGameFlow] toggleMusic];
}

-(void)toggleSound:(CCMenuItemToggle *)sender
{
	[[GameFlow sharedGameFlow] toggleSound];
}


-(void)play:(CCMenuItemSprite*)sender
{
/*#ifdef LITE_VERSION
    [self playTimeless:sender];
    return;
#else*/
    sender.isEnabled = false; // Disable play button(sender)
    sender.opacity = 100;
    chooseModeBkg.opacity = 255;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    CCLabelBMFont *highScoreBlitzLabel = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];

    highScoreBlitzLabel.scale = 0.5;
    [self addChild:highScoreBlitzLabel];
    int highScore = [[GameFlow sharedGameFlow] highScoreForCategory:@"grp.BLITZ"] ;
    if ( highScore ) {
         NSString *formattedNum = [numberFormatter stringFromNumber:
                                   [NSNumber numberWithInt: highScore ]];
            highScoreBlitzLabel.string = formattedNum;
     } else {
            highScoreBlitzLabel.string = @"No High Score";
     }
    
    CCLabelBMFont *highScoreTimeLessLabel = [CCLabelBMFont labelWithString:@"." fntFile:@"Points Font.fnt"];
    highScoreTimeLessLabel.position = ccp(240, 270) ;
    highScoreTimeLessLabel.scale = 0.5;
    highScore = [[GameFlow sharedGameFlow] highScoreForCategory:@"grp.TIMELESS"] ;
    [self addChild:highScoreTimeLessLabel];
    if ( highScore ) {
        NSString *formattedNum = [numberFormatter stringFromNumber:
                                  [NSNumber numberWithInt: highScore ]];
        highScoreTimeLessLabel.string = formattedNum;
    } else {
        highScoreTimeLessLabel.string = @"No High Score";
    }

    CCMenuItemSprite *blitz = [CCMenuItemSprite
                               itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"blitz-normal.png"]
                               selectedSprite:[CCSprite spriteWithSpriteFrameName:@"blitz-selected.png"]
                               target:self selector:@selector(playBlitz:)
                               ];
    blitz.position = ccp(150, 180);
    blitz.anchorPoint = ccp(0,0.5);
    highScoreBlitzLabel.position = ccp(320, 160);
    highScoreBlitzLabel.anchorPoint = ccp(1,0.5);
    
    CCMenuItemSprite *timeless = [CCMenuItemSprite 
                                  itemFromNormalSprite:[CCSprite spriteWithSpriteFrameName:@"timeless-normal.png"]
                                  selectedSprite:[CCSprite spriteWithSpriteFrameName:@"timeless-selected.png"]
                                  target:self selector:@selector(playTimeless:)
                                  ];
    timeless.position = ccp(150, 135);
    timeless.anchorPoint = ccp(0,0.5);
    highScoreTimeLessLabel.position = ccp(320, 115) ;
    highScoreTimeLessLabel.anchorPoint = ccp(1,0.5);


    [sender.parent addChild:blitz];
    [sender.parent addChild:timeless];

// #endif
}

-(void)playClassic:(id)sender
{
	[[GameFlow sharedGameFlow] playLevel:CLASSIC];
}

-(void)playBlitz:(id)sender
{
	[[GameFlow sharedGameFlow] playLevel:BLITZ];
}

-(void)playTimeless:(id)sender
{
	[[GameFlow sharedGameFlow] playLevel:TIMELESS];
}

-(void)fullVersion:(id)id
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
     @"itms-apps://itunes.apple.com/app/beat-enigma-crack-code-hack/id476353254?mt=8"] ];
}


-(void) updateCoinsLabel
{
    coinsLabel.string = [NSString stringWithFormat:@"%i Coins", [[UserTracking sharedUserTracking] coinCount] ];
}

#pragma mark -

- (IBAction) buttonPressed:(id)sender 
{ // Button was tapped, so display Action She
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil // @"Like This Game? Talk about it!" 
                                                             delegate:self 
                                                    cancelButtonTitle:@"Maybe Later" 
                                               destructiveButtonTitle:@"Follow us on Twitter" 
                                                    otherButtonTitles:@"Like us on Facebook"
                                  , @"Tell a Friend", @"Send us Feedback", nil];
    
    [actionSheet showInView: rootViewController.view]; 
    [actionSheet release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex 
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) { 
        if ( buttonIndex == [actionSheet destructiveButtonIndex] ) {
            [[UserTracking sharedUserTracking] logEvent:@"FollowTwitter"];
            [self twitter:nil];
            // [[Twitter sharedTwitterClient] sendUpdate:@"Hey check out this cool game!" ];
        } if ( buttonIndex == 1) {       // Twitter
            // [[FBClient sharedFBClient] postWall:@"Hey check out this cool game!" ];
            [[UserTracking sharedUserTracking] logEvent:@"LikeFacebook"];

            [self facebook:nil];
        } if ( buttonIndex == 2) {
            // Email
            [[UserTracking sharedUserTracking] logEvent:@"EmailFriend"];

            [self showMailComposerFor:nil subjet:@"Check out this cool game!" body:@"Check out this cool game, now available in the App Store\n\nBeat Enigma - Crack codes, hacking into the machine\n\nWatch the video trailer and learn more at:\n\nhttp://www.beatenigma.com/"];
        } if ( buttonIndex == 3) {
            // Add Feedback Connect
            [[UserTracking sharedUserTracking] logEvent:@"Feedback"];
            
            [self showMailComposerFor:[NSArray arrayWithObject:@"support@beatenigma.com"] subjet:@"Feedback" body:@""];        
        } 
    }
}

// Displays an email composition interface inside the application. Populates all the Mail fields. 
- (void)showMailComposerFor:(NSArray*)recipients  subjet:(NSString*) subject body:(NSString*)body
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil && [mailClass canSendMail]) {
        // Fill out the email body text
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = self;
        
        [picker setToRecipients:recipients];
        [picker setSubject:subject];
        [picker setMessageBody:body isHTML:NO];
        [rootViewController presentModalViewController:picker animated:YES]; 
        [picker release];
    } else {
        // Device is not configured for sending emails, so notify user.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Unable to Email" 
                                                            message:@"This device is not yet configured for sending emails." 
                                                           delegate:self 
                                                  cancelButtonTitle:@"Okay, I'll Try Later" 
                                                  otherButtonTitles:nil];
        [alertView show]; 
        [alertView release];
    }
}

// Dismisses the Mail composer when the user taps Cancel or Send. 
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{
    NSString *resultTitle = nil; 
    NSString *resultMsg = nil;
    BOOL showAlert = NO;
    switch (result) {
        case MFMailComposeResultCancelled: 
            resultTitle = @"Email Cancelled"; 
            resultMsg = @"You elected to cancel the email"; 
            break;
        case MFMailComposeResultSaved: 
            resultTitle = @"Email Saved"; 
            resultMsg = @"You saved the email as a draft"; 
            break;
        case MFMailComposeResultSent: 
            resultTitle = @"Email Sent"; 
            resultMsg = @"Your email was successfully delivered"; 
            break;
        case MFMailComposeResultFailed: 
            showAlert = YES;
            resultTitle = @"Email Failed"; 
            resultMsg = @"Sorry, the Mail Composer failed. Please try again."; 
            break;
        default: 
            showAlert = YES;
            resultTitle = @"Email Not Sent"; 
            resultMsg = @"Sorry, an error occurred. Your email could not be sent."; 
            break;
    } 
    
    if (showAlert) {
        // Notifies user of any Mail Composer errors received with an Alert View dialog.
        UIAlertView *mailAlertView = [[UIAlertView alloc] initWithTitle:resultTitle message:resultMsg delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [mailAlertView show]; 
        [mailAlertView release]; 
    }
    [resultTitle release]; 
    [resultMsg release];
    [rootViewController dismissModalViewControllerAnimated:YES];
}


@end
