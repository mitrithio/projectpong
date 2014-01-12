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

@property (nonatomic) AVAudioPlayer *backgroundSoundPlayer;

@property (nonatomic) AVAudioPlayer *gameSoundPlayer;

@end

@implementation PPM_AppDelegate

@synthesize gameSettingsAccess;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarHidden:YES withAnimation:NO];
    
    // Override point for customization after application launch.
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    
    if ([self.gameSettingsAccess getCurrentBackgroundSoundOnOff]){
    self.backgroundSoundPlayer = [AVAudioPlayer alloc];
    self.backgroundSoundPlayer = [self.backgroundSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
    }
    
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
        self.gameSoundPlayer = [AVAudioPlayer alloc];
    }
    
    //backgroundSound notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startPlaySound:) name:@"ppm_StartPlaySound" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeChangeNotification:) name:@"ppm_ThemeChanged" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backgroundSoundNotification:) name:@"ppm_BackgroundSoundOff" object:nil];
    
    
    //gameSound notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startGameNotification:) name:@"ppm_StartGameNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finalScoreVisualizeNotification:) name:@"ppm_FinalScoreVisualizeNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hitSomethingNotification:) name:@"ppm_HitSomethingNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enemyScoreFourthPoint:) name:@"ppm_EnemyScoreFourthPoint" object:nil];

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
    [self.backgroundSoundPlayer stop];
    self.backgroundSoundPlayer = [AVAudioPlayer alloc];
    self.backgroundSoundPlayer = [self.backgroundSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
    }
}

-(void)backgroundSoundNotification:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.backgroundSoundPlayer isPlaying]){
        [self.backgroundSoundPlayer stop]; }
    else{
        [self.backgroundSoundPlayer stop];
        self.backgroundSoundPlayer = [AVAudioPlayer alloc];
        self.backgroundSoundPlayer = [self.backgroundSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"MainSound"]] error:NULL];
        [self.backgroundSoundPlayer setVolume:0.3];
        [self.backgroundSoundPlayer setNumberOfLoops:-1];
        [self.backgroundSoundPlayer play];}
}

-(void)startPlaySound:(NSNotification*)notification
{
    [self.backgroundSoundPlayer setVolume:0.3];
    [self.backgroundSoundPlayer setNumberOfLoops:-1];
    [self.backgroundSoundPlayer play];
}

-(void)startGameNotification:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.backgroundSoundPlayer isPlaying]){
        [self.backgroundSoundPlayer stop];}
    
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
        //[self.gameSoundPlayer stop];
        self.gameSoundPlayer = [AVAudioPlayer alloc];
        NSString *path = @"GameStartSound";
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: path ofType: @"mp3"];
        self.gameSoundPlayer = [self.gameSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:soundFilePath] error:NULL];
        //[self.backgroundSoundPlayer setVolume:0.3];
        [self.gameSoundPlayer setNumberOfLoops:0];
        [self.gameSoundPlayer play];
    }
}

-(void)finalScoreVisualizeNotification:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.gameSoundPlayer isPlaying]){
        [self.gameSoundPlayer stop];}
    
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
       [self.gameSoundPlayer stop];
        self.gameSoundPlayer = [AVAudioPlayer alloc];
        NSString *path = @"GameOverSound";
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: path ofType: @"mp3"];
        self.gameSoundPlayer = [self.gameSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:soundFilePath] error:NULL];
        //[self.backgroundSoundPlayer setVolume:0.3];
        [self.gameSoundPlayer setNumberOfLoops:0];
        [self.gameSoundPlayer play];
    }
}

-(void)hitSomethingNotification:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
        [self.gameSoundPlayer stop];
        self.gameSoundPlayer = [AVAudioPlayer alloc];
        NSString *keyForSound = [notification object];
        self.gameSoundPlayer = [self.gameSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:keyForSound]] error:NULL];
        //[self.backgroundSoundPlayer setVolume:0.3];
        [self.gameSoundPlayer setNumberOfLoops:-1];
        [self.gameSoundPlayer play];
    }
}

-(void)enemyScoreFourthPoint:(NSNotification*)notification
{
    self.gameSettingsAccess = [[PPM_GameSettingsAccessClass alloc] init];
    if ([self.gameSettingsAccess getCurrentGameSoundOnOff]){
        [self.gameSoundPlayer stop];
        self.gameSoundPlayer = [AVAudioPlayer alloc];
        self.gameSoundPlayer = [self.gameSoundPlayer initWithContentsOfURL:[NSURL fileURLWithPath:[self.gameSettingsAccess setUrlForSoundWithKey:@"AlertSound"]] error:NULL];
        //[self.backgroundSoundPlayer setVolume:0.3];
        [self.gameSoundPlayer setNumberOfLoops:-1];
        [self.gameSoundPlayer play];
    }
}
@end
