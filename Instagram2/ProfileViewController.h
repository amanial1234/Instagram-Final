//
//  ProfileViewController.h
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN
    
@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet PFImageView *profileimage;
@property (weak, nonatomic) IBOutlet UILabel *authorname;

@end

NS_ASSUME_NONNULL_END
