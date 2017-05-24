//
//  ViewController.h
//  calculator
//
//  Created by Anna Mikheeva on 11.03.17.
//  Copyright © 2017 Anna Mikheeva. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    operationMultiply = 11,
    operationDivide = 12,
    operationAdd = 13,
    operationSubstract = 14,
    operationEqual = 15,
    operationPoint = 16,
    operationClear = 17
    
} calcOperations;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView* imageView;
@property (weak, nonatomic) IBOutlet UILabel* indicatorLabel;

@property (assign, nonatomic) CGFloat firstNum;
@property (assign, nonatomic) BOOL firstNumEntered;

@property (assign, nonatomic) CGFloat secondNum;
@property (assign, nonatomic) BOOL secondNumEntered;

@property (assign, nonatomic) calcOperations operation;
@property (assign, nonatomic) BOOL operationEntered;

@property (assign, nonatomic) NSInteger digitsAfterPoint;
@property (assign, nonatomic) BOOL pointEntered;

- (IBAction) buttonPressed: (UIButton *) sender;

@end

