//
//  DataManager.m
//  Test5
//
//  Created by MacMini1 on 11/6/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "DataManager.h"
#import "FBFood.h"
#import <Parse/Parse.h>

@implementation DataManager
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)getFood : (void(^)(NSMutableArray *food))_onSuccess onError:(void(^)(NSError *error))_onError
{
    PFQuery *query = [FBFood query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        if (!error)
        {
            NSPredicate *fruitPredicate = [NSPredicate predicateWithFormat:@"type contains %@", @"Fruit"];
            NSMutableArray *fruitArray = [[objects  filteredArrayUsingPredicate:fruitPredicate] mutableCopy];
            
            NSPredicate *vegetablePredicate = [NSPredicate predicateWithFormat:@"type contains %@", @"Vegetable"];
            NSMutableArray *vegetableArray = [[objects filteredArrayUsingPredicate:vegetablePredicate] mutableCopy];
            
            NSPredicate *imagePredicate = [NSPredicate predicateWithFormat:@"image contains %@", @"imageFile"];
            NSMutableArray *imageArray = [[objects filteredArrayUsingPredicate:imagePredicate] mutableCopy];
            _onSuccess([@[fruitArray,vegetableArray,imageArray] mutableCopy]);
        }
        else
         {
            _onError(error);
         }
        
    }];
    
   
}
@end
