//
//  pwdView.m
//  NewLockScreen
//
//  Created by Lu Yang Li on 2017/5/5.
//  Copyright © 2017年 Lu Yang Li. All rights reserved.
//

#import "pwdView.h"
#import "CircleView.h"
@interface pwdView ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSMutableArray *cycleViewMArray;
@end

@implementation pwdView
-(instancetype)initwithMyCount:(NSInteger )count frame:(CGRect)frame;
{
    
    pwdView *view = [[pwdView alloc] initWithFrame:frame];
    _count = count;
    return view;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initliztion];
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    
    CGFloat cycleViewW = 16;
    CGFloat cycleViewH = cycleViewW;
    
    
    for (int i = 0; i < 4; i++) {
        
        CircleView * cycleView = [[CircleView alloc] initWithFrame:CGRectMake(cycleViewW * i, 0, cycleViewW, cycleViewH)];
        [self.cycleViewMArray addObject:cycleView];
        [self addSubview:cycleView];

        
    }
}
-(void)fullViewAtIndexPath:(NSInteger)path
{
    if (path > self.cycleViewMArray.count) {
        return;
    }
    CircleView * cycleView = self.cycleViewMArray[path - 1];
    cycleView.backgroundColor = [UIColor greenColor];
}

-(void)unFullViewAtIndexPath:(NSInteger)path
{
   
    CircleView * cycleView = self.cycleViewMArray[path];
    cycleView.backgroundColor = [UIColor yellowColor];
}

-(void)initliztion
{
    
}

-(NSMutableArray *)cycleViewMArray
{
    if (!_cycleViewMArray) {
        _cycleViewMArray = [NSMutableArray array];
    }
    return _cycleViewMArray;
}

@end
