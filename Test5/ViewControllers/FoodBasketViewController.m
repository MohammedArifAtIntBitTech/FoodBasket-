//
//  FoodBasketViewController.m
//  Test5
//
//  Created by MacMini1 on 11/5/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import "FoodBasketViewController.h"
#import "DataManager.h"
#import <Parse/Parse.h>
#import "FBBaseTableViewCell.h"

@interface FoodBasketViewController ()

@end

@implementation FoodBasketViewController

#pragma mark -LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.foodTypesArray  = [[NSArray alloc] initWithObjects:@"Fruit",@"Vegetable", nil];
    pickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height - 500,self.view.frame.size.width, 216)];
    
    
    self.tableView.estimatedRowHeight = 100.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[DataManager sharedInstance]getFood:^(NSMutableArray *food){
         self.data = food;
         [self.tableView reloadData];
     } onError:^(NSError *error) {
         
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView - DataSource and delgates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([self.data[section] count]>0){
        FBFood *food = [self.data[section] firstObject];
        return food.type;
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    FBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FBBaseTableViewCell"];
    FBFood *food = self.data[indexPath.section][indexPath.row];
    [cell.spinnerView startAnimating];
    cell.foodLabel.text = food.name;
    cell.discriptionLabel.text = food.discription;
    PFFile *imageFile = [food objectForKey:@"imageFile"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
            cell.pfimage.image = image;
             [cell.spinnerView stopAnimating];
        }
    }];
    return cell;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString * yourText = textFiled3.text;//place here the text you want to calculate its size;
//    return 40 + [self heightForText:yourText];
//}
//
//-(CGFloat)heightForText:(NSString *)text
//{
//    NSInteger MAX_HEIGHT = 2000;
//    UITextView * textView = [[UITextView alloc] initWithFrame: CGRectMake(0, 0, 320, MAX_HEIGHT)];
//    textView.text = text;
//    textView.font = [UIFont boldSystemFontOfSize:12];
//    [textView sizeToFit];
//    return textView.frame.size.height;
//}









- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PFObject *object = self.data[indexPath.section][indexPath.row];
        [self.data [indexPath.section] removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [object deleteInBackground];
        
    }
}

@end
