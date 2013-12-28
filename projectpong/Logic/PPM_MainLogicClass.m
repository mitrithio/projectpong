//
//  PPM_MainLogicClass.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 20/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_MainLogicClass.h"
#import "PPM_Ball.h"
#import "PPM_Bar.h"

@interface PPM_MainLogicClass ()

@property (nonatomic, strong) PPM_Ball *ball;
@property (nonatomic, strong) PPM_Bar *enemyBar;
@property (nonatomic, strong) PPM_Bar *userBar;
@property (nonatomic) UIView *field;

@end

@implementation PPM_MainLogicClass

- (id)init
{
    @throw [NSException exceptionWithName:@"wrongInit" reason:@"Don't use this init. Use initWithGameField:" userInfo:nil];
}

- (id)initWithGameField:(UIView*)field
{
    self = [super init];
    if (self) {
        self.field = field;
        self.settings = [[PPM_Settings alloc] init];
    }
    return self;
}

-(void)setBallImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size
{
    if (!self.ball)
    {
        self.ball = [PPM_Ball alloc];
        self.ball = [self.ball initWithImage:image
                             initialPosition:position
                                       speed:[self getBallSpeed]
                                        Size:size];
    }
    else
    {
        [self.ball setImage:image];
        [self.ball setPosition:position];
        [self.ball setSpeed:[self getBallSpeed]];
        [self.ball setSize:size];
    }
}

-(void)setEnemyBarImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size
{
    if (!self.enemyBar)
    {
        self.enemyBar = [PPM_Bar alloc];
        self.enemyBar = [self.enemyBar initWithImage:image
                                     initialPosition:position
                                               speed:[self getBarSpeed]
                                                size:size];
    }
    else
    {
        [self.enemyBar setImage:image];
        [self.enemyBar setPosition:position];
        [self.enemyBar setSpeed:[self getBarSpeed]];
        [self.enemyBar setSize:size];
    }
}

-(void)setUserBarImage:(UIImage*)image InitialPosition:(CGPoint)position Size:(CGSize)size
{
    if (!self.userBar)
    {
        self.userBar = [PPM_Bar alloc];
        self.userBar = [self.userBar initWithImage:image
                                    initialPosition:position
                                              speed:[self getBarSpeed]
                                               size:size];
    }
    else
    {
        [self.userBar setImage:image];
        [self.userBar setPosition:position];
        [self.userBar setSpeed:[self getBarSpeed]];
        [self.userBar setSize:size];
    }
}

float deltaX;
float deltaY;

-(void)calculateDeltasForAngle:(float)angle
{
    deltaX = self.ball.speed * cosf(angle);
    deltaY = self.ball.speed * sinf(angle);
}

-(void)updateBallPositionForView:(UIImageView*)ballView
{
    [self.ball setPosition:CGPointMake(self.ball.position.x + deltaX, self.ball.position.y + deltaY)];
    [ballView setFrame:CGRectMake(self.ball.position.x, self.ball.position.y, self.ball.size.width, self.ball.size.height)];
    if (ballView.frame.origin.x <= ballView.superview.frame.origin.x)
    {
        @throw [NSException exceptionWithName:@"hitLeft" reason:@"hit the left" userInfo:nil];
    }
    if (ballView.frame.origin.y <= ballView.superview.frame.origin.y)
    {
        @throw [NSException exceptionWithName:@"hitUp" reason:@"hit the up" userInfo:nil];
    }
    if ((ballView.frame.origin.x + ballView.frame.size.width) >= (ballView.superview.frame.origin.x + ballView.superview.frame.size.width))
    {
        @throw [NSException exceptionWithName:@"hitRight" reason:@"hit the right" userInfo:nil];
    }
    if ((ballView.frame.origin.y + ballView.frame.size.height) >= (ballView.superview.frame.origin.y + ballView.superview.frame.size.height))
    {
        @throw [NSException exceptionWithName:@"hitDown" reason:@"hit the down" userInfo:nil];
    }
    if ((self.ball.position.y + self.ball.size.height) >= self.userBar.position.y && (self.ball.position.x + self.ball.size.width) >= self.userBar.position.x && self.ball.position.x <= (self.userBar.position.x + self.userBar.size.width)) {
        @throw [NSException exceptionWithName:@"hitDown" reason:@"hit the down" userInfo:nil];
    }
    
    if (self.ball.position.y <= (self.enemyBar.position.y + self.enemyBar.size.height) && (self.ball.position.x + self.ball.size.width) >= self.enemyBar.position.x && self.ball.position.x <= (self.enemyBar.position.x + self.enemyBar.size.width)) {
        @throw [NSException exceptionWithName:@"hitUp" reason:@"hit the up" userInfo:nil];
    }
}

float arrivingParallelCoordinatePoint;

-(void)calculateArrivingParallelCoordinatePointForAngle:(float)angle
{
    if (angle != M_PI_2 && angle != 3*M_PI_4)
    {
        float slope = tanf(angle);
        int yIntercept = self.ball.position.y - self.ball.position.x * slope;
        arrivingParallelCoordinatePoint = ((self.enemyBar.position.y + self.enemyBar.size.height) - yIntercept)/slope;
    }
    else
    {
        arrivingParallelCoordinatePoint = self.ball.position.x;
    }
    
    int randomDeltaArrivingPoint = arc4random() % (int)(self.enemyBar.size.width/2 + [self getBarDelta]);
    
    if (arc4random() < 0.5) {
        arrivingParallelCoordinatePoint += randomDeltaArrivingPoint;
    }
    else
    {
        arrivingParallelCoordinatePoint -= randomDeltaArrivingPoint;
    }
    
    if (arrivingParallelCoordinatePoint >= (self.field.frame.size.width - (self.enemyBar.size.width/2)))
    {
        arrivingParallelCoordinatePoint = self.field.frame.size.width - (self.enemyBar.size.width/2) - randomDeltaArrivingPoint;
    }
    else if (arrivingParallelCoordinatePoint <= (self.field.frame.origin.x + (self.enemyBar.size.width/2)))
    {
        arrivingParallelCoordinatePoint = (self.field.frame.origin.x + (self.enemyBar.size.width/2)) + randomDeltaArrivingPoint;
    }
    else
    {
        
    }
}

-(void)updateEnemyBarPositionForView:(UIImageView*)enemyBarView
{
    if (arrivingParallelCoordinatePoint < self.enemyBar.center) {
        [self.enemyBar setPosition:CGPointMake(self.enemyBar.position.x - self.enemyBar.speed, self.enemyBar.position.y)];
        [enemyBarView setFrame:CGRectMake(self.enemyBar.position.x, self.enemyBar.position.y, self.enemyBar.size.width, self.enemyBar.size.height)];
    }
    else if (arrivingParallelCoordinatePoint > self.enemyBar.center)
    {
        [self.enemyBar setPosition:CGPointMake(self.enemyBar.position.x + self.enemyBar.speed, self.enemyBar.position.y)];
        [enemyBarView setFrame:CGRectMake(self.enemyBar.position.x, self.enemyBar.position.y, self.enemyBar.size.width, self.enemyBar.size.height)];
    }
    if (self.enemyBar.center > arrivingParallelCoordinatePoint - self.getBarSpeed && self.enemyBar.center < arrivingParallelCoordinatePoint + self.getBarSpeed)
        arrivingParallelCoordinatePoint = self.enemyBar.center;
    
}

-(CGFloat)getBallSpeed
{
    switch ([self.settings aiDifficulty]) {
        case easy:
            return 5 + 0;
        case medium:
            return 5 + 2;
        case hard:
            return 5 + 4;
        default:
            NSLog(@"Error in parsing Difficulty enumeration");
            @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
    }
}

-(CGFloat)getBarSpeed
{
    return 5;
}

-(int)getBarDelta
{
    switch ([self.settings aiDifficulty]) {
        case easy:
            return (int)self.enemyBar.size.width/4;
        case medium:
            return (int)self.enemyBar.size.width/6;
        case hard:
            return (int)self.enemyBar.size.width/12;
        default:
            NSLog(@"Error in parsing Difficulty enumeration");
            @throw [NSException exceptionWithName:@"difficultyOutOfRange" reason:@"Error in setting the difficulty" userInfo:nil];
    }
}

@end
