//
//  ViewController.m
//  地址选择器
//
//  Created by 1暖通商城 on 2017/5/10.
//  Copyright © 2017年 1暖通商城. All rights reserved.
//

#import "ViewController.h"
#import "GFAddressPicker.h"
@interface ViewController ()<GFAddressPickerDelegate>
@property (nonatomic, strong) GFAddressPicker *pickerView;
@property (nonatomic,strong) UILabel *lab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50 , 100, 275,50);
    [button setTitle:@"选择" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(50 , 200, 270, 50)];
    self.lab.textAlignment = NSTextAlignmentCenter;
    
    _lab.backgroundColor = [UIColor redColor];

    [self.view addSubview:_lab];

}
- (void)btnAction:(UIButton *)sender
{
 
    self.pickerView = [[GFAddressPicker alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.pickerView updateAddressAtProvince:@"河南省" city:@"郑州市" town:@"金水区"];
    self.pickerView.delegate = self;
    self.pickerView.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:self.pickerView];
}
- (void)GFAddressPickerCancleAction
{
       [self.pickerView removeFromSuperview];
}

- (void)GFAddressPickerWithProvince:(NSString *)province
                               city:(NSString *)city area:(NSString *)area
{
    [self.pickerView removeFromSuperview];

    self.lab.text = [NSString stringWithFormat:@"%@  %@  %@",province,city,area];
    
    NSLog(@"%@  %@  %@",province,city,area);
}

//- (void)setPickerView:(GFAddressPicker*)pickerView {
//    if (!_pickerView) {
//        
//    }
//    _pickerView = pickerView;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
