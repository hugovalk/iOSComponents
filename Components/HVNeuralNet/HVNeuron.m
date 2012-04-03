//
//  HVNeuron.m
//  Components
//
//  Created by Valk Hugo on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HVNeuron.h"

@implementation HVInput
@synthesize index;
@synthesize weight;
- (id)initWithIndex:(int)i andWeight:(float)w 
{
    if (self = [super init]) {
        self.index = i;
        self.weight = w;
    }
    return self;
}
@end

@implementation HVNeuron

@synthesize inputs;



- (id)init
{
    if (self = [super init]) {
        [self createDefaultInputs];
    }
    return self;
}

- (NSArray *)createDefaultInputs
{
    NSMutableArray *newInputs = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        HVInput* input = [[HVInput alloc] initWithIndex:i andWeight:arc4random_uniform(1)];
        [newInputs addObject:input];
    }
    return [NSArray arrayWithArray:newInputs];
}

@end
