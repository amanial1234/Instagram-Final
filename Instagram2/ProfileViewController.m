//
//  ProfileViewController.m
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//

#import "ProfileViewController.h"
#import "Post.h"
#import <Parse/Parse.h>
#import "ProfileCollectionViewCell.h"

@interface ProfileViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *profileposts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void) setUser{
    PFUser *userName = [PFUser currentUser];
    self.authorname.text = userName.username;
    
}
-(void)getPosts{
    //Gets post based on query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.profileposts = posts;
            NSLog(@"%@", self.profileposts);
        } else {
            NSLog(@"%@", error.localizedDescription);
        }    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //Get number of rows depending on posts
    return self.profileposts.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //CollectionViewCell
    ProfileCollectionViewCell *cell = [self.collectionview dequeueReusableCellWithReuseIdentifier:@"ProfileCollectionViewCell" forIndexPath:indexPath];
    Post *post = self.profileposts[indexPath.row];
    cell.post = post;
    [self setUser];
    return cell;
}

@end
