//
//  ViewController.m
//  CarouselNews
//
//  Created by Mac on 2019/4/16.
//  Copyright © 2019 BFL. All rights reserved.
//

#import "ViewController.h"
#import "Jie_CarouselNewsView.h"
#import "FirstVC.h"

@interface ViewController ()<Jie_CarouselNewsViewDelegate, Jie_CarouselNewsDataSource>

@property(nonatomic, strong)Jie_CarouselNewsView *newsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    Jie_CarouselNewsView *newsView = [[Jie_CarouselNewsView alloc] init];
    newsView.dataSource = self;
    newsView.delegate = self;
    newsView.backgroundColor = UIColor.redColor;
    [self.view addSubview:newsView];
    newsView.frame = CGRectMake(0, 200, self.view.frame.size.width, 100);
    _newsView = newsView;
}


- (NSInteger)maxShowedRow:(Jie_CarouselNewsView *)jie_carouseNewView {
    return 1;
}

- (NSTimeInterval)carouseNewsTimeInterval:(Jie_CarouselNewsView *)jie_carouseNewView {
    return 1;
}

- (BOOL)carousenewsScrollPageingEnable:(Jie_CarouselNewsView *)jie_carouseNewView {
    return YES;
}


- (NSArray<NSString *> *)carouseNewsData:(Jie_CarouselNewsView *)jie_carouseNewView {
    return @[
             @"1、到此，一个上下字体无限滚动的轮播",
             @"2、当然代码的话写的还是比较烂的",
             @"3、到此，一个上下字出",
             @"4、到此，一个上下字体无限滚动的",
             @"5、到此，我会及",
             @"6、到此，一个上改。最后记录本文仅供参考",
             @"7、我会及时更改。最后记录本文仅",
             @"8、到此，及时更改。最后",
             @"9、到此，一出，我会及",
             @"10、到烂的，有不足地方请",
             @"11、到此，一个更改。最后记录本",
             @"12、最后记录本文仅供参考",
             @"13、我会及时更改。最后记录本文仅供参考",
             @"14、到此，一个时更改。最后记录本文仅供参考",
             @"15、最后记录本文仅供参考",
             @"16、本文仅供参考",
             @"17、当然代码的话写的还是比较烂的",
             @"18、我会及时更改。最后记录本文仅供参考",
             @"19、一个上下字体无限滚动的",
             @"20、到此，我会及时更改。最后记录本文仅供参考",
             @"21、一个上改。最后记录本文仅供参考",
             @"22、最后记录本文仅供参考",
             @"23、到此，及时更改。最后记录本文仅供参考",
             @"24、到此，一出，",
             @"25、更改。最后记录本文仅供参考",
             @"26、最后记录本文仅供参考",
             @"27、到此，一个更改。最后记录本文仅供参考"
             ];
}


- (void)selectedRowAtIndex:(NSInteger)index jie_carouseNewView:(Jie_CarouselNewsView *)jie_carouseNewView {
    NSLog(@"%ld", index);
}


- (void)dealloc {
    NSLog(@"=======");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FirstVC *VC = [[FirstVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
