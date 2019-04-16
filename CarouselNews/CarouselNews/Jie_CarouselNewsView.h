//
//  Jie_CarouselNewsView.h
//  CarouselNews
//
//  Created by Mac on 2019/4/16.
//  Copyright © 2019 BFL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Jie_CarouselNewsView;

@protocol Jie_CarouselNewsDataSource <NSObject>

@required
// 需要显示轮播的数据, 显示普通的字符串
- (NSArray<NSString *> *)carouseNewsData:(Jie_CarouselNewsView *)jie_carouseNewView;

@optional
// 修改最大显示的行数， 默认显示一行
- (NSInteger)maxShowedRow:(Jie_CarouselNewsView *)jie_carouseNewView;

// 需要显示轮播的数据, 显示属性字符串
- (NSArray<NSAttributedString *> *)carouseNewsAttributedData:(Jie_CarouselNewsView *)jie_carouseNewView;

// 默认0.05s
- (NSTimeInterval)carouseNewsTimeInterval:(Jie_CarouselNewsView *)jie_carouseNewView;

// 是否翻页滚动, 默认不按页滚动，
- (BOOL)carousenewsScrollPageingEnable:(Jie_CarouselNewsView *)jie_carouseNewView;

@end


@protocol Jie_CarouselNewsViewDelegate <NSObject>

- (void)selectedRowAtIndex:(NSInteger)index jie_carouseNewView:(Jie_CarouselNewsView *)jie_carouseNewView;

@end


@interface Jie_CarouselNewsView : UIView

@property(nonatomic, weak)id<Jie_CarouselNewsDataSource> dataSource;

@property(nonatomic, weak)id<Jie_CarouselNewsViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
