//
//  BlockTestViewController.m
//  BlockTest
//
//  Created by Ken Anderson on 4/29/12.
//  Copyright (c) 2012 University of Colorado, Boulder. All rights reserved.
//

#import "BlockTestViewController.h"

@interface BlockTestViewController ()

@end

@implementation BlockTestViewController

@synthesize answerLabel=_answerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setAnswerLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)runExampleOne:(UIButton *)sender {
    
    int value = 5;
    
    void (^aBlock)() = ^(void) {
        self.answerLabel.text = [NSString stringWithFormat:@"%d", value];
    };
    
    aBlock();
    
}

- (IBAction)runExampleTwo:(UIButton *)sender {
    
    int value = 10;
    
    void (^aBlock)() = ^(void) {
        self.answerLabel.text = [NSString stringWithFormat:@"%d", value];
    };
    
    value = 15;
    
    aBlock();
}

- (IBAction)runExampleThree:(UIButton *)sender {
    NSString *myString = @"foo";
    dispatch_async (dispatch_get_main_queue(), ^{
        self.answerLabel.text = myString;
    });
    myString = @"bar";
}

- (IBAction)runExampleFour:(UIButton *)sender {
    NSMutableString *myString = [NSMutableString stringWithString:@"foo"];
    dispatch_async (dispatch_get_main_queue(), ^{
        self.answerLabel.text = myString;
    });
    [myString setString:@"bar"];
}

- (IBAction)reset:(UIButton *)sender {
    
    self.answerLabel.text = @"[Not Yet Run ]";

}

@end
