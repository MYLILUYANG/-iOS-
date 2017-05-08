//
//  pwdView.h
//  NewLockScreen
//
//  Created by Lu Yang Li on 2017/5/5.
//  Copyright © 2017年 Lu Yang Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pwdView : UIView

-(instancetype)initwithMyCount:(NSInteger )count frame:(CGRect)frame;

-(void)fullViewAtIndexPath:(NSInteger)path;
-(void)unFullViewAtIndexPath:(NSInteger)path;
@end
