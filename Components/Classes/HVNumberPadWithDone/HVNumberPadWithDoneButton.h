//
//  HVNumberPadWithDoneButton.h
//
//  Created by Hugo Valk on 12/20/10.
//  Copyright 2010 Hugo Valk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HVNumberPadWithDoneDelegate.h"

@interface HVNumberPadWithDoneButton : UITextField {
@private
	HVNumberPadWithDoneDelegate *doneDelegate;
}

@end
