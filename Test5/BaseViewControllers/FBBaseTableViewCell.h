//
//  FBBaseTableViewCell.h
//  Test5
//
//  Created by Edward Kim on 11/30/15.
//  Copyright © 2015 MacMini1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ParseUI/ParseUI.h>

@interface FBBaseTableViewCell : PFTableViewCell
@property (strong, nonatomic) IBOutlet UILabel *foodLabel;
@property (weak, nonatomic) IBOutlet UILabel *discriptionLabel;

@property (weak, nonatomic) IBOutlet PFImageView *pfimage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinnerView;

@end
