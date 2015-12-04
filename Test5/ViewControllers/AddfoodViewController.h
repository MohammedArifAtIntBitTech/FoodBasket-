//
//  AddfoodViewController.h
//  Test5
//
//  Created by MacMini1 on 11/25/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FBBaseViewController.h"

@interface AddfoodViewController : FBBaseViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *foodTypesArray;
    UIImagePickerController *pickerImage;
    UIPickerView *pickerview;
}

@property (strong,nonatomic) NSData * ImageData;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UIButton *textField2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)getImage:(id)sender;
- (IBAction)SaveData:(id)sender;
- (IBAction)addType:(id)sender;


@end
