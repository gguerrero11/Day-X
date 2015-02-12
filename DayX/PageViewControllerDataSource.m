//
//  PageViewControllerDataSource.m
//  DayX
//
//  Created by Gamaliel Tellez on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PageViewController.h"
#import "PageViewControllerDataSource.h"
#import "DXDetailViewController.h"
#import "EntryController.h"




@implementation PageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSInteger *beforeIndex = ((DXDetailViewController *)viewController).index - 1;
    return [self viewControllerAtIndex:beforeIndex];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    
    NSInteger *afterIndex = ((DXDetailViewController *)viewController).index + 1;
    return [self viewControllerAtIndex:afterIndex];
    
}



-(UIViewController *)viewControllerAtIndex:(NSInteger) index{
    
    if(index < 0 || index >= [EntryController sharedInstance].entries.count) {
        return nil;
    }
    PageViewController *viewController = [PageViewController new];
    viewController.index = index;
    
    return viewController;
}


@end
