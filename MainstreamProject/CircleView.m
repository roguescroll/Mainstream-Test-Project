//
//  CircleView.m
//  MainstreamProject
//
//  Created by Ashwin Raghuraman on 2/21/15.
//  Copyright (c) 2015 Ashwin Raghuraman. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()
{
    CGFloat startAngle;
    CGFloat endAngle;
}
@property (nonatomic, strong) UILabel *progressLabel;
@end

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
        
        self.progressLabel = [UILabel new];
        [self addSubview:self.progressLabel];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    self.progressLabel.frame = CGRectMake((rect.size.width / 2.0) - 71/2.0, (rect.size.height / 2.0) - 45/2.0, 71, 45);
    int progressInt = (int)ceilf(self.percent);
    [self.progressLabel setTextAlignment:NSTextAlignmentCenter];
    self.progressLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:42.5];
    self.progressLabel.text = [NSString stringWithFormat:@"%d", progressInt];
    
    CAShapeLayer *circle=[CAShapeLayer layer];
    circle.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                                               radius: 130
                                           startAngle:2*M_PI*0-M_PI_2
                                             endAngle:2*M_PI*1-M_PI_2
                                            clockwise:YES].CGPath;
    circle.fillColor=[UIColor clearColor].CGColor;
    circle.strokeColor=[UIColor blackColor].CGColor;
    circle.lineWidth=4;
    [self.layer addSublayer:circle];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:130
                      startAngle:endAngle
                        endAngle:(startAngle - endAngle) * (_percent / 100.0) + endAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 20;
    [[UIColor redColor] setStroke];
    [bezierPath stroke];

}

@end
