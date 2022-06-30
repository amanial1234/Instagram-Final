//
//  ProfileCollectionViewCell.m
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//

#import "ProfileCollectionViewCell.h"
#import "Post.h"


@implementation ProfileCollectionViewCell

- (void)setPost:(Post *)post {
    _post = post;
    self.imagecollection.file = post[@"image"];
    [self.imagecollection loadInBackground];
}
@end
