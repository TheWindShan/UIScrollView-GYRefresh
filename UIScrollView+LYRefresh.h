//
//  UIScrollView+LYRefresh.h
//  Test
//
//  Created by GuangYuYang on 2017/5/23.
//  Copyright © 2017年 GuangYuYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LYRefresh)

- (void)ly_addTopRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)ly_addBottomRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)ly_addLeftRefresh:(void(^)(UIScrollView *scrollView))block;
- (void)ly_addRightRefresh:(void(^)(UIScrollView *scrollView))block;

- (void)ly_endTopRefresh;
- (void)ly_endBottomRefresh;
- (void)ly_endLeftRefresh;
- (void)ly_endRightRefresh;

@end
