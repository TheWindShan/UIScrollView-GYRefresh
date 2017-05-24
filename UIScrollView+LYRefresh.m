//
//  UIScrollView+LYRefresh.m
//  Test
//
//  Created by GuangYuYang on 2017/5/23.
//  Copyright © 2017年 GuangYuYang. All rights reserved.
//

#import "UIScrollView+LYRefresh.h"
#import <objc/runtime.h>

#define triggerOffset   25

@implementation UIScrollView (LYRefresh)

- (void)dealloc {
    if (objc_getAssociatedObject(self, @selector(observeContentOffset))) {
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
}

- (void)observeContentOffset {
    if (!objc_getAssociatedObject(self, @selector(observeContentOffset))) {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        objc_setAssociatedObject(self, @selector(observeContentOffset), @(YES), OBJC_ASSOCIATION_RETAIN);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    static BOOL preDragging = NO;
    //NSLog(@"%f",self.contentOffset.y);
    if ([keyPath isEqualToString:@"contentOffset"] && self.dragging ^ preDragging) {
        if ([self isTop] && ![self topRefreshing]) {
            //topRefresh
            [self setTopRefreshing:YES];
            [self exeBlock:[self topBlock]];
        }else if ([self isBottom] && ![self bottomRefreshing]) {
            //bottomRefresh
            [self setBottomRefreshing:YES];
            [self exeBlock:[self bottomBlock]];
        }else if ([self isLeft] && ![self leftRefreshing]) {
            //leftRefresh
            [self setLeftRefreshing:YES];
            [self exeBlock:[self leftBlock]];
        }else if ([self isRight] && ![self rightRefreshing]) {
            //rightRefresh
            [self setRightRefreshing:YES];
            [self exeBlock:[self rightBlock]];
        }
    }
    
    preDragging = self.dragging;
}

- (void)exeBlock:(void(^)(UIScrollView *scrollView))block {
    if (block) {
        block(self);
    }
}

#pragma mark - public method
- (void)ly_addTopRefresh:(void(^)(UIScrollView *scrollView))block {
    [self observeContentOffset];
    [self setTopBlock:block];
}

- (void)ly_addBottomRefresh:(void(^)(UIScrollView *scrollView))block {
    [self observeContentOffset];
    [self setBottomBlock:block];
}

- (void)ly_addLeftRefresh:(void(^)(UIScrollView *scrollView))block {
    [self observeContentOffset];
    [self setLeftBlock:block];
}

- (void)ly_addRightRefresh:(void(^)(UIScrollView *scrollView))block {
    [self observeContentOffset];
    [self setRightBlock:block];
}

- (void)ly_endTopRefresh {
    [self setTopRefreshing:NO];
}

- (void)ly_endBottomRefresh {
    [self setBottomRefreshing:NO];
}

- (void)ly_endLeftRefresh {
    [self setLeftRefreshing:NO];
}

- (void)ly_endRightRefresh {
    [self setRightRefreshing:NO];
}

#pragma mark - judgement
- (BOOL)isTop {
    return self.contentOffset.y <= -triggerOffset - self.contentInset.top;
}

- (BOOL)isBottom {
    return self.contentOffset.y + CGRectGetHeight(self.frame) >= self.contentSize.height + triggerOffset + self.contentInset.bottom;
}

- (BOOL)isLeft {
    return self.contentOffset.x <= -triggerOffset - self.contentInset.left;
}

- (BOOL)isRight {
    return self.contentOffset.x + CGRectGetWidth(self.frame) >= self.contentSize.width + triggerOffset + self.contentInset.right;
}

#pragma mark - setter & getter
//topBlock
- (void(^)(UIScrollView *scrollView))topBlock {
    return objc_getAssociatedObject(self, @selector(topBlock));
}

- (void)setTopBlock:(void(^)(UIScrollView *scrollView))topBlock {
    objc_setAssociatedObject(self, @selector(topBlock), topBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//bottomBlock
- (void(^)(UIScrollView *scrollView))bottomBlock {
    return objc_getAssociatedObject(self, @selector(bottomBlock));
}

- (void)setBottomBlock:(void(^)(UIScrollView *scrollView))bottomBlock {
    objc_setAssociatedObject(self, @selector(bottomBlock), bottomBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//leftBlock
- (void(^)(UIScrollView *scrollView))leftBlock {
    return objc_getAssociatedObject(self, @selector(leftBlock));
}

- (void)setLeftBlock:(void(^)(UIScrollView *scrollView))leftBlock {
    objc_setAssociatedObject(self, @selector(leftBlock), leftBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//rightBlock
- (void(^)(UIScrollView *scrollView))rightBlock {
    return objc_getAssociatedObject(self, @selector(rightBlock));
}

- (void)setRightBlock:(void(^)(UIScrollView *scrollView))rightBlock {
    objc_setAssociatedObject(self, @selector(rightBlock), rightBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//topRefreshing
- (BOOL)topRefreshing {
    return [objc_getAssociatedObject(self, @selector(topRefreshing)) boolValue];
}

- (void)setTopRefreshing:(BOOL)topRefreshing {
    objc_setAssociatedObject(self, @selector(topRefreshing), @(topRefreshing), OBJC_ASSOCIATION_RETAIN);
}

//bottomRefreshing
- (BOOL)bottomRefreshing {
    return [objc_getAssociatedObject(self, @selector(bottomRefreshing)) boolValue];
}

- (void)setBottomRefreshing:(BOOL)bottomRefreshing {
    objc_setAssociatedObject(self, @selector(bottomRefreshing), @(bottomRefreshing), OBJC_ASSOCIATION_RETAIN);
}

//leftRefreshing
- (BOOL)leftRefreshing {
    return [objc_getAssociatedObject(self, @selector(leftRefreshing)) boolValue];
}

- (void)setLeftRefreshing:(BOOL)leftRefreshing {
    objc_setAssociatedObject(self, @selector(leftRefreshing), @(leftRefreshing), OBJC_ASSOCIATION_RETAIN);
}

//rightRefreshing
- (BOOL)rightRefreshing {
    return [objc_getAssociatedObject(self, @selector(rightRefreshing)) boolValue];
}

- (void)setRightRefreshing:(BOOL)rightRefreshing {
    objc_setAssociatedObject(self, @selector(rightRefreshing), @(rightRefreshing), OBJC_ASSOCIATION_RETAIN);
}

@end
