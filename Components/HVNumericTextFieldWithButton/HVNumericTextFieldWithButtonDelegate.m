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
//  HVNumericTextFieldWithButtonDelegate.m
//
//  Created by Hugo Valk on 8/9/10.
//

#pragma mark HVNumberPadWithDoneDelegate.m
#import "HVNumericTextFieldWithButtonDelegate.h"

#pragma mark - Private methods
@interface HVNumericTextFieldWithButtonDelegate() {
    @private
    NSString *text;
}
-(void) startAddingButton;
-(void) addDoneButton;
-(void) createDoneButton;
-(void) doneClicked:(id)sender;
@end


#pragma mark - Implementation of HVNumberPadWithDoneDelegate
@implementation HVNumericTextFieldWithButtonDelegate

@synthesize textField;
@synthesize titleText;

#pragma mark - Initialize
-(id) initWithTextfield:(UITextField*)tf 
{
	if (self = [super init]) {
		self.textField = tf;
    }
	return self;
}

#pragma mark - Add Done button to number pad textField
-(void) startAddingButton
{
	[self performSelectorOnMainThread:@selector(addDoneButton) withObject:nil waitUntilDone:YES];
}

-(void) addDoneButton
{
	if (!doneButton)
		[self createDoneButton];
	// locate keyboard view
	UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] lastObject];
	[tempWindow addSubview:doneButton];
}

-(void) createDoneButton
{
	// Initialize button.
    doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
	doneButton.frame = CGRectMake(0, 427, 106, 53);
	doneButton.adjustsImageWhenHighlighted = NO;

    // Set target for button.
   	[doneButton addTarget:self action:@selector(doneClicked:) forControlEvents:UIControlEventTouchUpInside];

    // Set colors for button text.
    [doneButton setTitleColor:[UIColor colorWithRed:0.30f green:0.33f blue:0.38f alpha:1.0f] forState:UIControlStateNormal];
    [doneButton setTitleShadowColor:[UIColor colorWithRed:0.88f green:0.89f blue:0.9f alpha:1.0f] forState:UIControlStateNormal];
    [doneButton.titleLabel setShadowOffset:CGSizeMake(0.0f, 1.0f)];

    // Set font for button text.
    [doneButton.titleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    
    // Set text.
    [doneButton setTitle:[self buttonText] forState:UIControlStateNormal];
}

- (NSString *)buttonText
{
    if (self.titleText == nil) {
        return @"Done";
    } else {
        return titleText;
    }
}

#pragma mark - Handle Done button clicked event
-(void) doneClicked:(id)sender
{
	[doneButton removeFromSuperview];
	[textField resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    [doneButton setTitle:[self buttonText] forState:UIControlStateNormal];
	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(startAddingButton) userInfo:nil repeats:NO];
	return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{	
	[doneButton removeFromSuperview];
}

#pragma mark - Tear down
-(void)dealloc
{
	[doneButton removeFromSuperview];
}
@end
