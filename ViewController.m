//
//  ViewController.m
//  calculator
//
//  Created by Anna Mikheeva on 11.03.17.
//  Copyright © 2017 Anna Mikheeva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage* backgroundImage = [UIImage imageNamed:@"background.jpg"];
    self.imageView.image = backgroundImage;
    
    self.firstNum=self.secondNum=self.digitsAfterPoint = self.operation=0;
    self.firstNumEntered=self.secondNumEntered = self.pointEntered=self.operationEntered=NO;
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction) buttonPressed: (UIButton *) sender {
    
    NSInteger tag = sender.tag;
        
    if (tag > 10) {
        
    switch (tag) {

        case operationSubstract:
        {
            [self operationEntering: tag];
            break;
        }
            
        case operationDivide:
        {
            [self operationEntering: tag];
            break;
        }
            
        case operationAdd:
        {
            [self operationEntering: tag];
            break;
        }
            
        case operationMultiply:
        {
            [self operationEntering: tag];
            break;
        }
        
        case (operationEqual):
        {
            [self operationEqual];
            break;
        }
        
        case (operationPoint):
        {
            [self operationPoint];
            break;
        }
            
        case (operationClear):
        {
            [self operationClear];
            break;
        }
   
    }

    } else {
        [self numberEntering:sender.tag];
    }
    

    
}


#pragma mark - operations

- (void) operationClear {
    
    self.indicatorLabel.text = @"0";
    self.firstNum=self.secondNum=self.digitsAfterPoint=self.operation=0;
    self.firstNumEntered=self.secondNumEntered=self.operationEntered=self.pointEntered=NO;
    
}

- (void) numberEntering: (NSInteger) digit {
    
    if (self.firstNumEntered) {
        
        if (self.pointEntered) {
            
            self.digitsAfterPoint ++;
            self.secondNum = self.secondNum + (float)digit/(self.digitsAfterPoint*10);
            self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.secondNum];
            
            
        } else {
        
            self.secondNum = self.secondNum*10 + digit;
            self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.secondNum];
            
        }
        
    } else {
        
        if (self.pointEntered) {
            
            self.digitsAfterPoint ++;
            self.firstNum = self.firstNum + (float)digit/(self.digitsAfterPoint*10);
            self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
            
            
        } else {
        
            self.firstNum = self.firstNum*10 + digit;
            self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
            
        }
        
    }
    
}

- (void) operationEntering: (NSInteger) operation {
    
    if (self.operationEntered) {
        
        [self operationEqual];
        
    }
    
    self.firstNumEntered = YES;
    self.operationEntered = YES;
    self.pointEntered = NO;
    self.digitsAfterPoint=0;
    
    switch (operation) {
            
        case operationSubstract:
            self.operation = operationSubstract;
            self.indicatorLabel.text = @"-";
            break;
            
        case operationAdd:
            self.operation = operationAdd;
            self.indicatorLabel.text = @"+";
            break;
            
        case operationDivide:
            self.operation = operationDivide;
            self.indicatorLabel.text = @"/";
            break;
            
        case operationMultiply:
            self.operation = operationMultiply;
            self.indicatorLabel.text = @"*";
            break;

    }
    
}

- (void) operationEqual {
    
    if (self.operationEntered) {
        
        switch (self.operation) {
            
            case operationMultiply:
                self.firstNum = self.firstNum*self.secondNum;
                self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
                self.secondNum=0;
                self.operationEntered = NO;
                break;
                
            case operationAdd:
                self.firstNum = self.firstNum+self.secondNum;
                self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
                self.secondNum=0;
                self.operationEntered = NO;
                break;
                
            case operationSubstract:
                self.firstNum = self.firstNum-self.secondNum;
                self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
                self.secondNum=0;
                self.operationEntered = NO;
                break;
                
            case operationDivide:
                if (self.secondNum == 0){
                    
                    self.indicatorLabel.text =@"Oops! Divided by zero!";
                    self.firstNum=self.secondNum=self.digitsAfterPoint=self.operation=0;
                    self.firstNumEntered=self.secondNumEntered=self.operationEntered=self.pointEntered=NO;
                    break;
                    
                } else {
                    
                    self.firstNum = self.firstNum/self.secondNum;
                    self.indicatorLabel.text = [NSString stringWithFormat:@"%g", self.firstNum];
                    self.secondNum=0;
                    self.operationEntered = NO;
                    break;
                    
                }
                
            default:
                    break;
                
        }
        
    }
    
}
    

- (void) operationPoint {
    
    if (!self.pointEntered)
    {
        
        self.pointEntered=YES;
        self.indicatorLabel.text =[NSString stringWithFormat:@"%@%@", self.indicatorLabel.text, @"."];
    }
    
    
}

    


@end
