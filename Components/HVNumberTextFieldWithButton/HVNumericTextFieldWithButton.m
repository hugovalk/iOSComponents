//
//Copyright 2012 Hugo Valk (http://www.hugovalk.nl)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//
//  HVNumericTextFieldWithButton.m
//
//  Created by Hugo Valk on 12/20/10.
//

#import "HVNumericTextFieldWithButton.h"

@interface HVNumericTextFieldWithButton()
- (void)initialize;
@end

@implementation HVNumericTextFieldWithButton

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
        doneDelegate = [[HVNumericTextFieldWithButtonDelegate alloc] initWithTextfield:self];
        self.delegate = doneDelegate;
    }
}

- (void)setTitleText:(NSString *)title
{
    doneDelegate.titleText = title;
}

@end
