//
//  DXDetailViewController.m
//  DayX
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXDetailViewController.h"
#import "EntryController.h"

@interface DXDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) Entry *entry;

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

@end

@implementation DXDetailViewController

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.textField.text = entry.title;
    self.textView.text = entry.text;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
}

- (IBAction)save:(id)sender {

    Entry *entry = [[Entry alloc] initWithDictionary:@{titleKey: self.textField.text, textKey: self.textView.text}];
    
   // if ((self.textField.text = @"") && (self.textView.text = @""))
    
    
    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
