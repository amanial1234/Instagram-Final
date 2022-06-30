//
//  postcell.m
//  Instagram2
//
//  Created by Aman Abraham on 6/28/22.
//

#import "postcell.h"
#import "LoginViewController.h"

@implementation postcell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setPost:(Post *)post {
    _post = post;
    self.photoImageView.file = post[@"image"];
    [self.photoImageView loadInBackground];
}

@end
