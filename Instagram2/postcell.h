//
//  postcell.h
//  Instagram2
//
//  Created by Aman Abraham on 6/28/22.
//
    
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"
#import "Parse/PFImageView.h"



NS_ASSUME_NONNULL_BEGIN

@interface postcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *postComment;
@property (strong, nonatomic) PFUser *user;
@property (strong, nonatomic) IBOutlet PFImageView *photoImageView;
@property (strong, nonatomic) Post *post;
    

@end

NS_ASSUME_NONNULL_END
