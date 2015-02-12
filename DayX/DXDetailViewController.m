//
//  DXDetailViewController.m
//  DayX
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXDetailViewController.h"
#import "Entry.h"
#import "EntryController.h"

@interface DXDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

@property (nonatomic, strong) Entry *entry;

@end

@implementation DXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textView.delegate = self;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.entry.text = textView.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.entry.title = textField.text;
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";
    
}

- (IBAction)save:(id)sender {
    // newEntry is to be used for replaceEntry. It has currently unsaved data (unsaved to NSUserDefaults yet), so we create a temporary instance that can put as an object instance in replaceEntry
    Entry *newEntry = [[Entry alloc] initWithDictionary:@{titleKey: self.textField.text,
                                                          textKey: self.textView.text}];
    if (!self.entry) {
        [[EntryController sharedInstance] addEntry:self.entry];
    } else {
        [[EntryController sharedInstance] replaceEntry:newEntry withEntry:self.entry];
    }
    // Animation to "pop" back to previous menu.
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%lu",(unsigned long)[EntryController sharedInstance].entries.count);
}

- (void) updateWithEntry: (Entry *) entry {
    self.entry = entry;
    self.textView.text = entry.text;
    self.textField.text = entry.title;
}

@end
