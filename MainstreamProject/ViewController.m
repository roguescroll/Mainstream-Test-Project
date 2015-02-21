//
//  ViewController.m
//  MainstreamProject
//
//  Created by Ashwin Raghuraman on 2/21/15.
//  Copyright (c) 2015 Ashwin Raghuraman. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()
{
    CircleView *circleView;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Init our view
    [super viewDidLoad];
    circleView = [[CircleView alloc] initWithFrame:self.view.bounds];
    circleView.percent = 100;
    [self.view addSubview:circleView];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (circleView.percent > 0) {
        circleView.percent = circleView.percent - 1;
        [circleView setNeedsDisplay];
    }
    else {
        [timer invalidate];
        timer = nil;
    }
}

@end
