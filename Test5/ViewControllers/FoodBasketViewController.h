//
//  FoodBasketViewController.h
//  Test5
//
//  Created by MacMini1 on 11/5/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FBBaseTableViewController.h"

@interface FoodBasketViewController : FBBaseTableViewController <UIAlertViewDelegate ,UITextFieldDelegate, UIPickerViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UITextField *textFiled1;
    UITextField *textFiled2;
    UITextField *textFiled3;

    UIAlertView *message;
    UIPickerView *pickerview;
    UIImagePickerController *pickerImage;
}
@property (strong, nonatomic) NSArray *foodTypesArray;
@property (strong, nonatomic) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *images;
@end
