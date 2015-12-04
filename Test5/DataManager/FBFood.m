//
//  FBFoodObject.m
//  Test5
//
//  Created by MacMini1 on 11/13/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FBFood.h"
#import <Parse/Parse.h>
@implementation FBFood
@dynamic type;
@dynamic name;
@dynamic discription;
@dynamic imageFile;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"FBFood";
}

@end

