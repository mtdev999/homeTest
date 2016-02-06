//
//  MTDrawingView.m
//  MTDrawingTest
//
//  Created by Mark Tezza on 04.02.16.
//  Copyright © 2016 Mark Tezza. All rights reserved.
//

#import "MTDrawingView.h"

@implementation MTDrawingView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint centerPoint = CGPointMake(arc4random_uniform(200) + 50, arc4random_uniform(200) + 50);
    
    for (int i = 0; i < 5; i++) {
        
        //[self drawStar:context];
        
        [UIView beginAnimations:@"animate" context:context];
        
        [self drawStarInContext:context
             withNumberOfPoints:5
                         center:centerPoint //CGPointMake(100, 100)
                    innerRadius:100
                    outerRadius:40
                      fillColor:[UIColor greenColor]
                    strokeColor:[UIColor redColor]
                    strokeWidth:1];
    }
}



- (void)drawStar:(CGContextRef)context {
    
    int aSize = 100.0;
    CGContextSetLineWidth(context, aSize);
    
    CGFloat xCenter = arc4random_uniform(200) + 50;
    CGFloat yCenter = arc4random_uniform(200) + 50;
    
    float  w = 100.0f;
    double r = w / 2.0f;
    float flip = -1.0f;
    
    for (NSUInteger i = 0; i < 1; i++)
    {
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        
        double theta = 2.0f * M_PI * (2.0f / 5.0f); // 144 degrees
        
        CGContextMoveToPoint(context, xCenter, r * flip + yCenter);
        
        for (NSUInteger k = 1; k < 5; k++)
        {
            float x = r * sin(k * theta);
            float y = r * cos(k * theta);
            CGContextAddLineToPoint(context, x + xCenter, y * flip + yCenter);
        }
        xCenter += 150.0;
    }
    
    CGContextClosePath(context);
    CGContextFillPath(context);
}

- (void)drawStarInContext:(CGContextRef)context
       withNumberOfPoints:(NSInteger)points
                   center:(CGPoint)center
              innerRadius:(CGFloat)innerRadius
              outerRadius:(CGFloat)outerRadius
                fillColor:(UIColor *)fill
              strokeColor:(UIColor *)stroke
              strokeWidth:(CGFloat)strokeWidth
{
    CGFloat arcPerPoint = 2.0f * M_PI / points;
    CGFloat theta = M_PI / 2.0f;
    
    // Move to starting point (tip at 90 degrees on outside of star)
    CGPoint pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
    CGContextMoveToPoint(context, pt.x, pt.y);
    
    for (int i = 0; i < points; i++) {
        // Calculate next inner point (moving clockwise), accounting for crossing of 0 degrees
        theta = theta - (arcPerPoint / 2.0f);
        if (theta < 0.0f) {
            theta = theta + (2 * M_PI);
        }
        pt = CGPointMake(center.x - (innerRadius * cosf(theta)), center.y - (innerRadius * sinf(theta)));
        CGContextAddLineToPoint(context, pt.x, pt.y);
        
        // Calculate next outer point (moving clockwise), accounting for crossing of 0 degrees
        theta = theta - (arcPerPoint / 2.0f);
        if (theta < 0.0f) {
            theta = theta + (2 * M_PI);
        }
        pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
        CGContextAddLineToPoint(context, pt.x, pt.y);
    }
    CGContextClosePath(context);
    CGContextSetLineWidth(context, strokeWidth);
    [fill setFill];
    [stroke setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
