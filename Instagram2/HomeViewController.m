//
//  HomeViewController.m
//  Instagram
//
//  Created by Aman Abraham on 6/27/22.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "postcell.h"
#import "Post.h"
#import "Parse/PFImageView.h"
#import "SceneDelegate.h"
#import "DetailsViewController.h"
#import <UIKit/UIKit.h>


@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *foundPosts;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL isMoreDataLoading;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //delegates
    self.tableView.delegate= self;
    self.tableView.dataSource = self;
    [self getPosts];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];

}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    //Refreshing coding
    [self getPosts];
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

-(void)getPosts{
    //query my posts
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.foundPosts = posts;
            [self.tableView reloadData];
            NSLog(@"%@", self.foundPosts);
        } else {
            NSLog(@"%@", error.localizedDescription);
        }    }];
}

-(void) loadMoreData{
    //loading mroe data for infinite scrolling
    [self getPosts];
    self.isMoreDataLoading = false;
    [self.tableView reloadData];
}

- (IBAction)didTapLogout:(id)sender {
    //logout button
    NSLog(@"Works");
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
        self.view.window.rootViewController = loginViewController;
    }];
}


- (IBAction)tapCompose:(id)sender {
    [self performSegueWithIdentifier:@"showCompose" sender:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //scrolling/infinite scrolling
    if(!self.isMoreDataLoading){
        int scrollViewContentHeight = self.tableView.contentSize.height;
        int scrollOffsetThreshold = scrollViewContentHeight - self.tableView.bounds.size.height;
        if(scrollView.contentOffset.y > scrollOffsetThreshold && self.tableView.isDragging) {
            self.isMoreDataLoading = true;
            [self loadMoreData];
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foundPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Gets objects for HomeView
    postcell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *postIG = self.foundPosts[indexPath.row];
    cell.postComment.text = postIG.caption;
    cell.photoImageView.file = self.foundPosts[indexPath.row][@"image"];
    [cell.photoImageView loadInBackground];
    return cell;
}

    
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Segue to Details View COntroller
    if([[segue identifier] isEqualToString:@"detailsSegue"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
        DetailsViewController *detailsViewController = [segue destinationViewController];
        Post *post = self.foundPosts[indexpath.row];
        detailsViewController.post = post;
    }
}



@end
