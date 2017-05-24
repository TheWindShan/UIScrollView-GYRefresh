# UIScrollView-LYRefresh
UIScrollView Category:top refresh; bottom refresh; left refresh; right refresh

## usage
```objc

    [scrollView ly_addTopRefresh:^(UIScrollView *scrollView) {
        NSLog(@"topRefresh");
        [scrollView ly_endTopRefresh];
    }];
    
    [scrollView ly_addBottomRefresh:^(UIScrollView *scrollView) {
        NSLog(@"bottomRefres");
        [scrollView ly_endBottomRefresh];
    }];
    
    [scrollView ly_addLeftRefresh:^(UIScrollView *scrollView) {
        NSLog(@"leftRefresh");
        [scrollView ly_endLeftRefresh];
    }];
    
    [scrollView ly_addRightRefresh:^(UIScrollView *scrollView) {
        NSLog(@"rightRefresh");
        [scrollView ly_endRightRefresh];
    }];
```
