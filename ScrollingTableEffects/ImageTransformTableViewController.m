//
//  ImageTransformTableViewController.m
//  ScrollingTableEffects
//
//  Created by Tobin Schwaiger-Hastanan on 4/4/14.
//  Copyright (c) 2014 Tobin Schwaiger-Hastanan. All rights reserved.
//

#import "ImageTransformTableViewController.h"
#import "ImageTableViewCell.h"

@interface ImageTransformTableViewController ()

@end

@implementation ImageTransformTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    CGRect frame = [self.tableView rectForRowAtIndexPath:indexPath];
    
    CGFloat scale = (frame.origin.y - (self.tableView.contentOffset.y + 64.0) + 400.0 ) / 400.0;
    cell.photo.transform = CGAffineTransformScale( CGAffineTransformIdentity,
                                                  1.0 + 0.5 * scale,
                                                  1.0 + 0.5 * scale);
    
    [cell setNeedsLayout];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray* indexPaths = [self.tableView indexPathsForVisibleRows];
    NSLog( @"%d", [indexPaths count]);
    for( NSIndexPath* indexPath in indexPaths ) {
        
        ImageTableViewCell* cell = (ImageTableViewCell*) [self.tableView cellForRowAtIndexPath:indexPath];
        CGRect frame = [self.tableView rectForRowAtIndexPath:indexPath];
        CGFloat scale = (frame.origin.y - (scrollView.contentOffset.y + 64.0) + 400.0 ) / 400.0;
        cell.photo.transform = CGAffineTransformScale( CGAffineTransformIdentity,
                                                1.0 + 0.5 * scale,
                                                1.0 + 0.5 * scale);
        cell.gradientView.alpha = scale / 0.50 - 0.5;
    }
}


@end
