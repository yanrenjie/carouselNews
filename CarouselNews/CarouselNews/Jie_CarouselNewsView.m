//
//  Jie_CarouselNewsView.m
//  CarouselNews
//
//  Created by Mac on 2019/4/16.
//  Copyright © 2019 BFL. All rights reserved.
//

#import "Jie_CarouselNewsView.h"

@interface Jie_CarouselNewsView ()

@property(nonatomic, weak)NSTimer *timer;

@property(nonatomic, strong)NSArray *dataArray;

@property(nonatomic, strong)NSArray *attributedDataArray;

@property(nonatomic, assign)NSInteger showedRow;

@property(nonatomic, assign)NSTimeInterval timeInterval;

@property(nonatomic, assign)BOOL pageingEnable;

@property(nonatomic, strong)NSMutableArray<UILabel *> *labelArray;

@property(nonatomic, assign)NSInteger lastIndex;

@end

static NSInteger defaultShowedRow = 1;
static NSTimeInterval defaultTimeInterval = 0.05;
static BOOL defaultPageingEnable = NO;


@implementation Jie_CarouselNewsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}


- (void)layoutSubviews {
    [self addLabels];
    [self.timer fire];
}


- (void)addLabels {
    CGFloat labelH = self.frame.size.height / _showedRow;
    CGFloat labelW = self.frame.size.width;
    
    for (int i = 0; i < _showedRow; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, labelH * i, labelW, labelH)];
        label.tag = i;
        label.userInteractionEnabled = YES;
        if (_dataArray.count != 0) {
            label.text = _dataArray[i];
        }
        if (_attributedDataArray.count != 0) {
            label.attributedText = _attributedDataArray[i];
        }
        [self addSubview:label];
        [self.labelArray addObject:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [label addGestureRecognizer:tap];
    }
    
    if (_dataArray.count > _showedRow || _attributedDataArray.count > _showedRow) {
        UILabel *lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, labelH * _showedRow, labelW, labelH)];
        lastLabel.userInteractionEnabled = YES;
        if (_dataArray.count != 0) {
            lastLabel.text = _dataArray[_showedRow];
        }
        if (_attributedDataArray.count != 0) {
            lastLabel.attributedText = _attributedDataArray[_showedRow];
        }
        [self addSubview:lastLabel];
        [self.labelArray addObject:lastLabel];
        _lastIndex = _showedRow;
        lastLabel.tag = _showedRow;
        
        UITapGestureRecognizer *last_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [lastLabel addGestureRecognizer:last_tap];
    }
}


- (void)setDataSource:(id<Jie_CarouselNewsDataSource>)dataSource {
    _dataSource = dataSource;
    
    if ([_dataSource respondsToSelector:@selector(maxShowedRow:)]) {
        _showedRow = [_dataSource maxShowedRow:self];
    } else {
        _showedRow = defaultShowedRow;
    }
    
    if ([_dataSource respondsToSelector:@selector(carouseNewsData:)]) {
        _dataArray = [_dataSource carouseNewsData:self];
    }
    
    if ([_dataSource respondsToSelector:@selector(carouseNewsAttributedData:)]) {
        _attributedDataArray = [_dataSource carouseNewsAttributedData:self];
    }
    
    if ([_dataSource respondsToSelector:@selector(carouseNewsTimeInterval:)]) {
        _timeInterval = [_dataSource carouseNewsTimeInterval:self];
    } else {
        _timeInterval = defaultTimeInterval;
    }
    
    if ([_dataSource respondsToSelector:@selector(carousenewsScrollPageingEnable:)]) {
        _pageingEnable = [_dataSource carousenewsScrollPageingEnable:self];
    } else {
        _pageingEnable = defaultPageingEnable;
    }
}


- (NSMutableArray<UILabel *> *)labelArray {
    if (!_labelArray) {
        _labelArray = [[NSMutableArray alloc] init];
    }
    return _labelArray;
}


- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeInterval target:self selector:@selector(changLabelFrame) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}


- (void)changLabelFrame {
    [self.labelArray enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.frame.origin.y <= -(self.frame.size.height / self.showedRow)) {
            obj.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height / self.showedRow);
            self.lastIndex++;
            if (self.lastIndex == self.dataArray.count) {
                self.lastIndex = 0;
            }
            obj.tag = self.lastIndex;
            if (self.dataArray.count != 0) {
                obj.text = self.dataArray[self.lastIndex];
            }
            if (self.attributedDataArray.count != 0) {
                obj.attributedText = self.attributedDataArray[self.lastIndex];
            }
        } else {
            CGRect rect = obj.frame;
            if (self.pageingEnable) {
                [UIView animateWithDuration:0.5 animations:^{
                    obj.frame = CGRectMake(rect.origin.x, rect.origin.y - rect.size.height, rect.size.width, rect.size.height);
                } completion:^(BOOL finished) {
                    if (obj.frame.origin.y <= -(self.frame.size.height / self.showedRow)) {
                        obj.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height / self.showedRow);
                        self.lastIndex++;
                        if (self.lastIndex == self.dataArray.count) {
                            self.lastIndex = 0;
                        }
                        obj.tag = self.lastIndex;
                        if (self.dataArray.count != 0) {
                            obj.text = self.dataArray[self.lastIndex];
                        }
                        if (self.attributedDataArray.count != 0) {
                            obj.attributedText = self.attributedDataArray[self.lastIndex];
                        }
                    }
                }];
            } else {
                obj.frame = CGRectMake(rect.origin.x, rect.origin.y - 1, rect.size.width, rect.size.height);
            }
        }
    }];
}


- (void)tapAction:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(selectedRowAtIndex:jie_carouseNewView:)]) {
        [self.delegate selectedRowAtIndex:tap.view.tag jie_carouseNewView:self];
    }
}


// 主动释放定时器
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (!newSuperview && self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


- (void)dealloc {
    NSLog(@"123");
}

@end
