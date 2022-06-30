//
//  ComposeViewController.h
//  Instagram
//`
//  Created by Aman Abraham on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *composeimage;
@property (weak, nonatomic) IBOutlet UITextView *captionField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sharebutton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelbutton;

@end

NS_ASSUME_NONNULL_END
                
