//
//  PPM_AppDelegate.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 17/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_AppDelegate.h"

#import <AVFoundation/AVFoundation.h>

@interface PPM_AppDelegate ()

@property (nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation PPM_AppDelegate

@synthesize gameSettingsAccess;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarHidden:YES withAnimation:NO];
    
    // Override point for customization after application launch.
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    if ([self.gameSettingsAccess getCurrentBackgroundSoundOnOff]){
    self.audioPlayer = [AVAudioPlayer alloc];
    self.audioPlayer = [self.audioPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
    
    
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startPlaySound:) name:@"ppm_StartPlaySound" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangeNotification:) name:@"ppm_ThemeChanged" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundSoundNotification:) name:@"ppm_BackgroundSoundOff" object:nil];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)themeChangeNotification:(NSNotification*)notification
{
      self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.gameSettingsAccess getCurrentBackgroundSoundOnOff]){
    [self.audioPlayer stop];
    self.audioPlayer = [AVAudioPlayer alloc];
    self.audioPlayer = [self.audioPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
    }
}

-(void)backgroundSoundNotification:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.audioPlayer isPlaying]){
        [self.audioPlayer stop]; }
    else{
        [self.audioPlayer stop];
        self.audioPlayer = [AVAudioPlayer alloc];
        self.audioPlayer = [self.audioPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
        [self.audioPlayer setVolume:0.3];
        [self.audioPlayer setNumberOfLoops:-1];
        [self.audioPlayer play];}
}

-(void)startPlaySound:(NSNotification*)notification
{
    [self.audioPlayer setVolume:0.3];
    [self.audioPlayer setNumberOfLoops:-1];
    [self.audioPlayer play];
}
@end
