//
//  PageViewControllerDataSource.h
//  DayX
//
//  Created by Gamaliel Tellez on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>

-(UIViewController *)viewControllerAtIndex:(NSInteger) index;


@end
