//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

/*setter method: setOperand method sets value of "operand" instance variable*/
-(void)setOperand:(double)anOperand {
    operand = anOperand;
}



/*performWaitingOperation (a private method, must declare in implementation file before you use it, ***but not need to be in header file***): takes waitingOperation and performs on operand and waitingOperand.  waitingOperand initially has no value*/
/*Note that @"+" is an object that can be sent messages.  Could instead write [waitingOperation isEqual:@"+"]*/
/*Why not include this as part of performOperation? */
-(void)performWaitingOperation {
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"*" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"/" isEqual:waitingOperation]) {
        if (operand) { /*check that operand is not zero*/
            operand = waitingOperand / operand;
        }
    } 
}

/*performOperation: performs previously pressed operation (waitingOperation) with waitingOperand and operand (through private method performWaitingOperation); then saves currently pressed operation as "waitingOperation" and the just calculated value as "waitingOperand"*/
-(double)performOperation:(NSString *)operation {
    if ([operation isEqual:@"sqrt"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"x*x"]) {
        operand = operand * operand;
    } else {
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
    
}
@end

/*Need to fix/check:
 Value of waitingOperand when calculator brain instantiated?
 What if press two operations in a row? operand becomes same as waiting operand (b/c it's still in the display)
 "Clear all" button would clear display and values for waitingOperand, waitingOperation
 */