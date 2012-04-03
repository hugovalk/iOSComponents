//
//  HVNeuron.h
//  Components
//
//  Created by Valk Hugo on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HVInput : NSObject
@property int index;
@property float weight;
- (id)initWithIndex:(int)i andWeight:(float)w;
@end


@interface HVNeuron : NSObject

@property (readonly) NSArray *inputs;

@end
