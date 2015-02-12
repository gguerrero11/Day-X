//
//  EntryController.h
//  DayX
//
//  Created by Gabriel Guerrero on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject
// This holds all the entry data
@property (strong) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry;

- (void)loadFromDefaults;

@end
