//
//  ViewController.m
//  NewLockScreen
//
//  Created by Lu Yang Li on 2017/5/5.
//  Copyright © 2017年 Lu Yang Li. All rights reserved.
//

#import "ViewController.h"
#import "pwdView.h"
#define K_width  [UIScreen mainScreen].bounds.size.width
#define K_height [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *stringMArray;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSString *baseString;
@property (nonatomic, strong) pwdView *passWordView;
@property (nonatomic, weak) UIButton *deleteBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int row = 4;
    int column = 3;
    
    float buttonW = 40.0f;
    float buttonH = buttonW;
    
    float Lefmarin = (K_width - buttonW * 3 - 20) / 4;
    float Topmarin = Lefmarin / 2;
    
    int k = 1;
    
    for (int i = 0; i < row; i++) {
        
        for (int j = 0; j < column; j++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(((Lefmarin + 10) * j)+ Lefmarin, 100 + (buttonH + Topmarin) * i, buttonW, buttonH)];
            if (k == 10) {
                k = 0;
            }
            button.backgroundColor = [UIColor redColor];
            button.layer.cornerRadius = buttonH * 0.5;
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            [button setTitle:[NSString stringWithFormat:@"%d",k] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.layer.borderColor = [UIColor yellowColor].CGColor;
            [button addTarget:self action:@selector(tapBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = k;
            if ((i == 3 && j == 0) || (i == 3 && j == 2)) continue;
        
            [self.view addSubview:button];
            
            k++;
            
        }
    }
    
    _passWordView = [[pwdView alloc] initwithMyCount:4 frame:CGRectMake(0, 450, K_width, 30)] ;
    
    [self.view addSubview:_passWordView];
    //_textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 400, K_width, 30)];
    //[self.view addSubview:_textField];
    
    
    UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [deleteBtn setTitle:@"delete" forState:UIControlStateNormal];
    [deleteBtn setTintColor:[UIColor blackColor]];
    [deleteBtn addTarget:self action:@selector(deleteCycleView:) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:deleteBtn];
    _deleteBtn = deleteBtn;
    
}

-(void)deleteCycleView:(UIButton *)sender
{
    [self.stringMArray removeLastObject];
    [_passWordView unFullViewAtIndexPath:self.stringMArray.count];

}

-(void)tapBtnAction:(UIButton *)sender
{
    NSString *tagStr = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    [self.stringMArray addObject:tagStr];
    [_passWordView fullViewAtIndexPath:self.stringMArray.count];
    if (self.stringMArray.count > 4) {
        NSLog(@"最多只能4位");
        //[self.stringMArray removeAllObjects];
        // 进行密码校验
        [self.stringMArray removeLastObject];
        return;
    }
    
    _baseString = @"";
    for (NSString *text in self.stringMArray) {
        
        _baseString = [self.baseString stringByAppendingString:text];
        
    }
    _textField.text = _baseString;
    
    NSLog(@"%@",_textField.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)stringMArray
{
    if (!_stringMArray) {
        _stringMArray = [NSMutableArray array];
    }
    return _stringMArray;
}

-(NSString *)baseString
{
    if (!_baseString) {
        _baseString = [[NSString alloc] init];
    }
    return _baseString;
}

@end
