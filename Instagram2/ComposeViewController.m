//
//  ComposeViewController.m
//  Instagram
//
//  Created by Aman Abraham on 6/27/22.
//

#import "ComposeViewController.h"
#import "Post.h"
#import <Parse/Parse.h>

@interface ComposeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //gets image
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    [self.composeimage setImage:editedImage];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)selectImageFromLibrary:(id)sender {
    //gets photo from library
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)takePicture:(id)sender {
    //take a picture goes to camera
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)sharePost:(id)sender {
    //share button
    if (self.composeimage.image && self.captionField.text) {
           [Post postUserImage:self.composeimage.image withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
               NSLog(@"Image posted Successfully!");
               [self dismissViewControllerAnimated:YES completion:nil];
           }];
       } else {
           NSLog(@"Missing an image and/or caption!");
       }
    
}
- (IBAction)cancelCompose:(id)sender {
    //cancel button
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil]; 
}


@end
