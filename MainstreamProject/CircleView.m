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
        self.backgroundColor = [UIColor blueColor];
        
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
    self.progressLabel.frame = CGRectMake((rect.size.width / 2.0) - 125/2.0, (rect.size.height / 2.0) - 125/2.0, 125, 125);
    int progressInt = (int)ceilf(self.percent);
    [self.progressLabel setTextAlignment:NSTextAlignmentCenter];
    self.progressLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:70];
    self.progressLabel.text = [NSString stringWithFormat:@"%d", progressInt];
    self.progressLabel.textColor = [UIColor whiteColor];
    
    UIBezierPath* fixedBezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [fixedBezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:130
                      startAngle:startAngle
                        endAngle:endAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    fixedBezierPath.lineWidth = 5;
    [[UIColor blackColor] setStroke];
    [fixedBezierPath stroke];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:130
                      startAngle:startAngle
                        endAngle:(endAngle - startAngle) * (_percent / 100.0) + startAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 20;
    [[UIColor greenColor] setStroke];
    [bezierPath stroke];

}

@end
