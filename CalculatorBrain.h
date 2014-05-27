//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <Foundation/Foundation.h>

/*These instance variables can be moved to a class extension, and operand can be defined as a property, using @synthesize to create setter/getter methods*/

@interface CalculatorBrain : NSObject {
    @private
    double operand; /*Is set by ViewController, but through setter method*/
    NSString *waitingOperation;
    double waitingOperand;
}

/*These methods are called by ViewController on self brain*/

-(void)setOperand:(double)anOperand;
-(double)performOperation:(NSString *)operation;

@end
