//
//  DataManager.h
//  Test5
//
//  Created by MacMini1 on 11/6/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBFood.h"
@interface DataManager : NSObject
+ (instancetype)sharedInstance;
@property (strong, nonatomic)UIImageView * imageView;

- (void)getFood : (void(^)(NSMutableArray *food))_onSuccess onError:(void(^)(NSError *error))_onError;
@end
