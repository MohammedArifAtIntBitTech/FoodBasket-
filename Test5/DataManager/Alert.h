//
//  Alert.h
//  Test5
//
//  Created by MacMini1 on 11/23/15.
//  Copyright (c) 2015 MacMini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Alert : UIAlertView <UIAlertViewDelegate ,UITextFieldDelegate>

{
    
        UITextField *textFiled1;
        UITextField *textFiled2;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
+ (UIAlertView*) showAlertViewWithTitle:(NSString*)title message:(NSString*)message dismiss:(NSString*)dismiss;
@end
