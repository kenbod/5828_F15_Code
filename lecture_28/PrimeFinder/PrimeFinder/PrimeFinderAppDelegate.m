//
//  PrimeFinderAppDelegate.m
//  PrimeFinder
//
//  Created by Ken Anderson on 4/29/12.
//  Copyright (c) 2012 University of Colorado, Boulder. All rights reserved.
//

#import "PrimeFinderAppDelegate.h"

@interface PrimeFinderAppDelegate ()

- (void) countPrimesUpTo:(int)upperBound WithPartitions:(int)partitions;
- (int) countPrimesFrom:(int)lowerBound To:(int)upperBound;
- (void) disableEverything;
- (void) enableEverything;
- (BOOL) isPrime:(int)number;
- (void) processResult:(int)result;

@end

@implementation PrimeFinderAppDelegate

@synthesize window = _window;
@synthesize resetButton = _resetButton;
@synthesize calculateButton = _calculateButton;
@synthesize spinner = _spinner;
@synthesize upperBound = _upperBound;
@synthesize partitions = _partitions;
@synthesize answer = _answer;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

- (void) processResult:(int)result {
    self.answer.stringValue = [NSString stringWithFormat:@"%d", result];
    [self enableEverything];
}

- (void) processPartialResult:(int)result {
    int newTotal = self.answer.intValue + result;
    self.answer.stringValue = [NSString stringWithFormat:@"%d", newTotal];
}


- (IBAction)reset:(NSButton *)sender {
    NSLog(@"CALLING RESET!!!");
    self.upperBound.intValue = 10000000;
    self.partitions.intValue = 100;
    self.answer.stringValue = @"[Not Yet Run]";
}

- (BOOL) isPrime:(int)number {
    if (number <= 1) return NO;
    
    for (int i = 2; i <= sqrt(number); i++) {
        if (number % i == 0) {
            return NO;
        }
    }
    return YES;
}

- (int) countPrimesFrom:(int)lowerBound To:(int)upperBound {
    int total = 0;
    
    for (int i = lowerBound; i <= upperBound; i++) {
        if ([self isPrime:i]) {
            total++;
        }
    }
    return total;
}

- (void) countPrimesUpTo:(int)upperBound WithPartitions:(int)partitions {
    
    int chunksPerPartition = upperBound / partitions;
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:partitions];
    NSMutableArray *lower = [NSMutableArray arrayWithCapacity:partitions];
    NSMutableArray *upper = [NSMutableArray arrayWithCapacity:partitions];
    
    for (int i = 0; i < partitions; i++) {
        [results addObject:[NSNull null]];
        [lower addObject:[NSNull null]];
        [upper addObject:[NSNull null]];
    }
    
    dispatch_apply(partitions, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
        [lower replaceObjectAtIndex:(int)i withObject:[NSNumber numberWithInt:((int)i * chunksPerPartition) + 1]];
        [upper replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:(i == partitions - 1) ? upperBound : [[lower objectAtIndex:i] intValue] + chunksPerPartition - 1]];
    });
    
    dispatch_apply(partitions, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
        [results replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:[self countPrimesFrom:[[lower objectAtIndex:i] intValue] To:[[upper objectAtIndex:i] intValue]]]];
        dispatch_async(
            dispatch_get_main_queue(), ^(void) {
                [self processPartialResult:[[results objectAtIndex:i] intValue]]; 
            });

    });
    
    int total = 0;
    
    for (int i = 0; i < partitions; i++) {
        total += [[results objectAtIndex:i] intValue];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self processResult:total]; 
    });

}

- (IBAction)calculate:(NSButton *)sender {
    [self disableEverything];
    int upper_bound = self.upperBound.intValue;
    int partitions  = self.partitions.intValue;
    NSLog(@"upper_bound: %d", upper_bound);
    NSLog(@"partitions : %d", partitions);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        [self countPrimesUpTo:upper_bound WithPartitions:partitions];
    });
}

- (void)disableEverything {
    //self.upperBound.enabled = NO;
    //self.partitions.enabled = NO;
    self.calculateButton.enabled = NO;
    self.resetButton.enabled = NO;
    self.spinner.hidden = NO;
    [self.spinner startAnimation: self];
}

- (void)enableEverything {
    //self.upperBound.enabled = YES;
    //self.partitions.enabled = YES;
    self.calculateButton.enabled = YES;
    self.resetButton.enabled = YES;
    [self.spinner stopAnimation: self];
    self.spinner.hidden = YES;
}

@end
