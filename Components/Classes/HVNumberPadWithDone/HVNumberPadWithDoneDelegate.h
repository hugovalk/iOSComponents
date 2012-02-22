//
//  HVNumberPadDelegate.h
//  
//
//  Created by Hugo Valk on 8/9/10.
//  Copyright 2010 Hugo Valk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HVNumberPadWithDoneDelegate : NSObject <UITextFieldDelegate> {
@private
	UIButton *doneButton;
	UITextField* textField;
}

@property (nonatomic, retain) UITextField *textField;

-(id) initWithTextfield:(UITextField*)tf;

@end
