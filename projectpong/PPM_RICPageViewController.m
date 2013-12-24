//
//  PPM_RICPageViewController.m
//  ProjectPong
//
//  Created by Andrea Cavicchia on 19/12/13.
//  Copyright (c) 2013 Andrea Cavicchia. All rights reserved.
//

#import "PPM_RICPageViewController.h"
#import "PPM_CreditsViewController.h"
#import "PPM_InfoViewController.h"
#import "PPM_RuleViewController.h"

@interface PPM_RICPageViewController ()

@property (nonatomic, weak) PPM_CreditsViewController *creditsView;
@property (nonatomic, weak) PPM_InfoViewController *infoView;
@property (nonatomic, weak) PPM_RuleViewController *rulesView;

@end

@implementation PPM_RICPageViewController

- (PPM_RuleViewController *)rulesView {
    
    if (!_rulesView) {
        UIStoryboard *storyboard = self.storyboard;
        _rulesView = [storyboard instantiateViewControllerWithIdentifier:@"RulesView"];
    }
    
    return _rulesView;
}

- (PPM_InfoViewController *)infoView {
    if (!_infoView) {
        UIStoryboard *storyboard = self.storyboard;
        _infoView = [storyboard instantiateViewControllerWithIdentifier:@"InfoView"];
    }
    
    return _infoView;
}

- (PPM_CreditsViewController *)creditsView {
    if (!_creditsView) {
        UIStoryboard *storyboard = self.storyboard;
        _creditsView = [storyboard instantiateViewControllerWithIdentifier:@"CreditsView"];
    }
    
    return _creditsView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.dataSource = self;
    
    [self setViewControllers:@[self.rulesView]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    UIViewController *nextViewController = nil;
    
    if (viewController == self.rulesView)
    {
        nextViewController = self.infoView;
    }
    else if (viewController == self.infoView)
    {
        nextViewController = self.creditsView;
    }
    
    return nextViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    UIViewController *nextViewController = nil;
    
    if (viewController == self.infoView)
    {
        nextViewController = self.rulesView;
    }
    else if (viewController == self.creditsView)
    {
        nextViewController = self.infoView;
    }
    
    return nextViewController;
}

@end
