//
//  HVNumberPadWithDoneButton.m
//
//  Created by Hugo Valk on 12/20/10.
//  Copyright 2010 Hugo Valk. All rights reserved.
//

#import "HVNumberPadWithDoneButton.h"


@implementation HVNumberPadWithDoneButton

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		self.keyboardType = UIKeyboardTypeNumberPad;
		doneDelegate = [[HVNumberPadWithDoneDelegate alloc] initWithTextfield:self];
		self.delegate = doneDelegate;
	}
	return self;
}


@end
