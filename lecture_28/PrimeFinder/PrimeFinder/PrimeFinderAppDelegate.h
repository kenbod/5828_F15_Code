//
//  PrimeFinderAppDelegate.h
//  PrimeFinder
//
//  Created by Ken Anderson on 4/29/12.
//  Copyright (c) 2012 University of Colorado, Boulder. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PrimeFinderAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong) IBOutlet NSButton *resetButton;

@property (weak) IBOutlet NSButton *calculateButton;

@property (strong) IBOutlet NSProgressIndicator *spinner;

@property (strong) IBOutlet NSTextField *upperBound;

@property (strong) IBOutlet NSTextField *partitions;

@property (strong) IBOutlet NSTextField *answer;

- (IBAction)reset:(NSButton *)sender;

- (IBAction)calculate:(NSButton *)sender;

@end
