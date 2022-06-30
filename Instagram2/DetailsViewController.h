//
//  DetailsViewController.h
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//


#import "ViewController.h"
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property (strong, nonatomic) Post *post;
//@property (weak, nonatomic) IBOutlet UIImageView *detailsImage;
@property (weak, nonatomic) IBOutlet UILabel *detailsCreatedAt;
@property (weak, nonatomic) IBOutlet UILabel *detailsCaption;
@property (weak, nonatomic) IBOutlet PFImageView *detailsImage;

@end


NS_ASSUME_NONNULL_END
