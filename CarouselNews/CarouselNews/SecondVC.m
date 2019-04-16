//
//  SecondVC.m
//  CarouselNews
//
//  Created by Mac on 2019/4/16.
//  Copyright © 2019 BFL. All rights reserved.
//

#import "SecondVC.h"
#import "ViewController.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController *vc = [[ViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
