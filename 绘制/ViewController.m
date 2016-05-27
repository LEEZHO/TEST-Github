//
//  ViewController.m
//  绘制
//
//  Created by 李子海LEO on 5/24/16.
//  Copyright © 2016 李子海LEO. All rights reserved.
//

#import "ViewController.h"
#import "LEOView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LEOView *view = [[LEOView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.view = view;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
