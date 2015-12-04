//
//  AddfoodViewController.m
//  Test5
//
//  Created by MacMini1 on 11/25/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "AddfoodViewController.h"
#import "FoodBasketViewController.h"
#import "FBBaseTableViewController.h"
#import "DataManager.h"
#import "FBFood.h"
#import <Parse/Parse.h>


@interface AddfoodViewController ()

@end

@implementation AddfoodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    foodTypesArray  = [[NSArray alloc] initWithObjects:@"Fruit",@"Vegetable", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getImage:(id)sender
{
    pickerImage = [[UIImagePickerController alloc] init];
    pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerImage.delegate = self;
    [self presentViewController:pickerImage animated:YES completion:nil];
}

#pragma UIImagePickerController Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    
    UIImage *originalImage = (UIImage *) [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    self.imageView.image = originalImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.imageView.hidden = NO;
    self.imageView.image = image;
    self.ImageData  = UIImageJPEGRepresentation(image, 0.5f);
    [self dismissModalViewControllerAnimated:NO];
    
}

- (IBAction)SaveData:(id)sender
{
    
    
    NSData *imageData = UIImageJPEGRepresentation(_imageView.image, 0.8);
    NSString *filename = [NSString stringWithFormat:@"%@.png", _textField1.text];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    FBFood *food = [[FBFood alloc]init];
    food.name = self.textField1.text;
    food.discription = self.textField3.text;
    food.type = self.textField2.titleLabel.text;
    food.imageFile = imageFile;
[food saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
         if (succeeded)
         {
             [self.navigationController popToRootViewControllerAnimated:YES] ;
         }
    }];
}

- (IBAction)addType:(id)sender
{
    pickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height - 500,self.view.frame.size.width, 100)];
    pickerview.delegate = self;
    [self.view addSubview:pickerview];
}

#pragma UItextFieldDelegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma UIPickerVireDelegate & datasource  Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return foodTypesArray.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.textField2 setTitle:[foodTypesArray objectAtIndex:row] forState:UIControlStateNormal];
    [pickerView setHidden:YES];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [foodTypesArray objectAtIndex:row];
}
@end
