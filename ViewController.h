//
//  ViewController.h
//  Calculator
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"


@interface ViewController : UIViewController {

    IBOutlet UILabel *display; /* (outlet) hook up controller to the view*/
    CalculatorBrain *brain; /*pointer (outlet) from controller to model*/
    BOOL userIsInTheMiddleOfTypingNumber;
}

/*IBAction analogous to "void", use if an action you want to wire up in Interface Builder*/
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;

@end
