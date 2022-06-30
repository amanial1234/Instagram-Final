//
//  DetailsViewController.m
//  Instagram2
//
//  Created by Aman Abraham on 6/30/22.
//

#import "DetailsViewController.h"
#import <Parse/Parse.h>
#import "postcell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    //gets objects and converts the time to hours apart
    [super viewDidLoad];
    self.detailsCaption.text = self.post.caption;
    self.detailsImage.file = self.post.image;
    [self.detailsImage loadInBackground];
    NSDate *tweetDate = self.post.createdAt;
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
    formatter.allowedUnits = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour;
    NSString *elapsed = [formatter stringFromDate:tweetDate toDate:[NSDate date]];
    self.detailsCreatedAt.text = elapsed;
}

@end
