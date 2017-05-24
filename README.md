# UIScrollView-GYRefresh
UIScrollView Category:top refresh; bottom refresh; left refresh; right refresh

## usage
```objc

    [scrollView gy_addTopRefresh:^(UIScrollView *scrollView) {
        NSLog(@"topRefresh");
        [scrollView gy_endTopRefresh];
    }];
    
    [scrollView gy_addBottomRefresh:^(UIScrollView *scrollView) {
        NSLog(@"bottomRefres");
        [scrollView gy_endBottomRefresh];
    }];
    
    [scrollView gy_addLeftRefresh:^(UIScrollView *scrollView) {
        NSLog(@"leftRefresh");
        [scrollView gy_endLeftRefresh];
    }];
    
    [scrollView gy_addRightRefresh:^(UIScrollView *scrollView) {
        NSLog(@"rightRefresh");
        [scrollView gy_endRightRefresh];
    }];
```
