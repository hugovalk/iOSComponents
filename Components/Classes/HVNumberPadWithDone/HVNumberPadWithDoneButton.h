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
//  HVNumberPadWithDoneButton.h
//
//  Created by Hugo Valk on 12/20/10.
//

#import <UIKit/UIKit.h>
#import "HVNumberPadWithDoneDelegate.h"

@interface HVNumberPadWithDoneButton : UITextField {
@private
	HVNumberPadWithDoneDelegate *doneDelegate;
}

- (void)setTitleText:(NSString *)title;

@end
