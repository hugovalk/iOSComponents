//
//  HVNumberPadWithDoneButton.m
//
//  Created by Hugo Valk on 12/20/10.
//  Copyright 2010 Hugo Valk. All rights reserved.
//

#import "HVNumberPadWithDoneButton.h"

@interface HVNumberPadWithDoneButton()
- (void)initialize;
@end

@implementation HVNumberPadWithDoneButton



- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
        [self initialize];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}
 

- (void)initialize
{
    if (doneDelegate == nil) {
        self.keyboardType = UIKeyboardTypeNumberPad;
        doneDelegate = [[HVNumberPadWithDoneDelegate alloc] initWithTextfield:self];
        self.delegate = doneDelegate;
    }
}


@end
