//
//  HVNumberPadDelegate.m
//
//  Created by Hugo Valk on 8/9/10.
//  Copyright 2010 Hugo Valk. All rights reserved.
//
#pragma mark HVNumberPadWithDoneDelegate.m
#import "HVNumberPadWithDoneDelegate.h"

#pragma mark -
#pragma mark Private methods
@interface HVNumberPadWithDoneDelegate()
-(void) startAddingButton;
-(void) addDoneButton;
-(void) createDoneButton;
-(void) doneClicked:(id)sender;
@end


#pragma mark -
#pragma mark Implementation of HVNumberPadWithDoneDelegate
@implementation HVNumberPadWithDoneDelegate

@synthesize textField;

#pragma mark -
#pragma mark Initialize
-(id) initWithTextfield:(UITextField*)tf
{
	if (self = [super init]) 
		self.textField = tf;	
	return self;
}

#pragma mark -
#pragma mark Add Done button to number pad textField
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
	doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
	doneButton.frame = CGRectMake(0, 427, 106, 53);
	doneButton.adjustsImageWhenHighlighted = NO;
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
		[doneButton setImage:[UIImage imageNamed:@"DoneUp3.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"] forState:UIControlStateHighlighted];
	} else {        
		[doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
	}
	[doneButton addTarget:self action:@selector(doneClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -
#pragma mark Handle Done button clicked event
-(void) doneClicked:(id)sender
{
	[doneButton removeFromSuperview];
	[textField resignFirstResponder];
}

#pragma mark -
#pragma mark UITextFieldDelegate
-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
	[NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(startAddingButton) userInfo:nil repeats:NO];
	return YES;
}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{	
	[doneButton removeFromSuperview];
}

#pragma mark -
#pragma mark Tear down
-(void)dealloc
{
	[doneButton removeFromSuperview];
}
@end
