//
//  BlockTestViewController.h
//  BlockTest
//
//  Created by Ken Anderson on 4/29/12.
//  Copyright (c) 2012 University of Colorado, Boulder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockTestViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *answerLabel;

- (IBAction)runExampleOne:(UIButton *)sender;

- (IBAction)runExampleTwo:(UIButton *)sender;

- (IBAction)runExampleThree:(UIButton *)sender;

- (IBAction)runExampleFour:(UIButton *)sender;

- (IBAction)reset:(UIButton *)sender;

@end
