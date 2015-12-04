//
//  FBFoodObject.h
//  Test5
//
//  Created by MacMini1 on 11/13/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface FBFood : PFObject<PFSubclassing>
@property (strong,nonatomic) NSString * type;
@property (strong,nonatomic) NSString * name;
@property (strong, nonatomic) NSString *discription;
@property (strong, nonatomic) PFFile * imageFile;

+ (NSString *)parseClassName;

@end
