//
//  CircleView.m
//  NewLockScreen
//
//  Created by Lu Yang Li on 2017/5/5.
//  Copyright © 2017年 Lu Yang Li. All rights reserved.
//

#import "CircleView.h"
#import "UIView+Frame.h"
@implementation CircleView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
        
    }
    return self;
}

-(void)setupView
{
    
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = self.lly_width * 0.5;
    self.layer.borderColor = [UIColor yellowColor].CGColor;
    self.layer.masksToBounds = YES;
    
    
}
-(void)setViewFull:(BOOL)full
{
    self.backgroundColor = [UIColor blackColor];
    
    
    
}
@end
