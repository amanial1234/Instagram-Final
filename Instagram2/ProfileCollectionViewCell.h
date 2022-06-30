//
//  ProfileCollectionViewCell.h
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "Parse.h"
#import "Parse/PFImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet PFImageView *imagecollection;

@property (strong, nonatomic) Post *post;

@end


NS_ASSUME_NONNULL_END
