//
//  UIScrollView+GYRefresh.h
//  Test
//
//  Created by GuangYuYang on 2017/5/23.
//  Copyright © 2017年 GuangYuYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GYRefresh)

- (void)gy_addTopRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)gy_addBottomRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)gy_addLeftRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)gy_addRightRefresh:(void(^)(UIScrollView *scrollView))block;

- (void)gy_endTopRefresh;
- (void)gy_endBottomRefresh;
- (void)gy_endLeftRefresh;
- (void)gy_endRightRefresh;

@end
