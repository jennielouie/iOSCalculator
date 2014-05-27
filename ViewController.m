//
//  ViewController.m
//  Calculator
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/*This is where private properties are declared*/
@end

@implementation ViewController

/*Lazy instantiation of calculator brain. When [self brain] called, this will create brain if it does not already exist.*/
/* This method called "brain" will create and return an instance, object of CalculatorBrain.  This object will be sent a message whose arguments (operand, operation) are obtained from the display and the operation button.*/

-(CalculatorBrain *)brain {
    if (!brain) {
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

/*digitPressed: Get the digit based on button, if not in middle of typing number then show that digit, otherwise add digit to end of number already in the display.  Set "userIsInTheMiddleOfTypingNumber" to YES.*/
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [[sender titleLabel] text];
    if (userIsInTheMiddleOfTypingNumber) {
        [display setText:[[display text] stringByAppendingString:digit]];
    } else {
        [display setText:digit];
        userIsInTheMiddleOfTypingNumber = YES;
    }
}

/*operationPressed: if an operation button is pressed, set the displayed number as operand,
 reset "userIsInTheMiddleOfTypingNumber to NO, get the operation based on button label, get instance of calculator brain to perform the operation, display result.*/
- (IBAction)operationPressed:(UIButton *)sender{
    if (userIsInTheMiddleOfTypingNumber) {
        //[[self brain] setOperand:[[display text] doubleValue]];
        [self brain].operand = [[display text] doubleValue];
        userIsInTheMiddleOfTypingNumber = NO;
    }
    NSString *operation = [[sender titleLabel] text];
    double result = [[self brain] performOperation:operation];
    [display setText:[NSString stringWithFormat:@"%g", result]];
    

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
