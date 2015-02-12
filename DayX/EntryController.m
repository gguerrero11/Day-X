//
//  EntryController.m
//  DayX
//
//  Created by Gabriel Guerrero on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

@implementation EntryController

static NSString * const entryKey = @"entry";

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        // this one instance will get all its data from loadFromDefaults
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}
- (void)addEntry:(Entry *)entry {
    if (!entry) {
        return;
    }
    NSMutableArray *mDictionary = [[NSMutableArray alloc]initWithArray:self.entries];
    [mDictionary addObject:entry];
    
    self.entries = mDictionary;
    [self synchronize:mDictionary];
}

- (void)removeEntry:(Entry *)entry {
    if(!entry){
        return;
    }
    NSMutableArray *mRemoveDictionary = [[NSMutableArray alloc]initWithArray:self.entries];
    [mRemoveDictionary removeObject:entry];
    
    self.entries = mRemoveDictionary;
    [self synchronize:mRemoveDictionary];
}

- (void)replaceEntry:(Entry *)oldEntry withEntry:(Entry *)newEntry {
    if(!oldEntry) {
        return;
    }
    NSMutableArray *mReplaceDictionary = [[NSMutableArray alloc]initWithArray:self.entries];
    for (NSDictionary *entry in mReplaceDictionary) {
        if(entry[entryKey] == oldEntry) {
            oldEntry = newEntry;
        }
    } [self synchronize:mReplaceDictionary];
}


// This method loads all the data from UserDefaults, copies the Object in each Key into a secondary array thats mutable so we can add more to it (Since the user will be adding more entries).
- (void)loadFromDefaults {
    
    // The UserDefaults dictionary at key "entryKey" is passed into entryDictionaries
    // It's an indexed array (nonmutable) of Objects at "entryKey"
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults]objectForKey:entryKey];

    
    // We create a mutable array so that we can add more objects to it
    NSMutableArray *entries = [NSMutableArray new];
    // So we create an NSDictionary (entry) that goes through each key in the defArray array.
    for (NSDictionary *entry in entryDictionaries) {
        // The mutableArray (entries) gets an added object of an Entry type (Entry.h) for each of its indexes
        // It's copying the defArray (which isn't mutable) to a secondary array that is mutable (entries)
        // Each 'index' in the "entries" mutableArray will contain an instance of Entry with a NSDictionary
        [entries addObject:[[Entry alloc] initWithDictionary:entry]];
    }
    // The mutableArray "entries" will get passed back into the property of this class.
    // (It does lose its "mutability" because its being passed into a regular NSArray.
    self.entries = entries; 
    
}

- (void)synchronize:(NSArray *)entries {
    NSMutableDictionary *entryDictionary = entries;

    for (Entry *entry in entries) {
        // For every Entry instance in the passed "entries" dictionary, add that same instance to the "entryDictionary" that was instantiated. We do this because the passed array "entries" is not mutable (NSArray). That is the state of the original dictionary (from NSUserDefaults)
        // Essentailly we're copying that entry into another array.
        // "[entry entryDictionary]" works because the initializer is overridden to instantiate with a dictionary
        [entryDictionary setObject:entryDictionary forKey:entryKey];
        
    }
    // We are passing it back into NSUserDefaults (it turns it back into an immutable dictionary), at the Key, "entryKey"
    // (entryDictonary is a Dictionary in each Key is an object instance of Entry (which has its own dictionary with keys for text, title, timestamp.
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionary forKey:entryKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}



@end
