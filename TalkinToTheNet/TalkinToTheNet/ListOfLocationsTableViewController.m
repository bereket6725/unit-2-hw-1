//
//  ListOfLocationsTableViewController.m
//  TalkinToTheNet
//
//  Created by Bereket  on 9/24/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "ListOfLocationsTableViewController.h"
#import "DetailLocationViewController.h"

@interface ListOfLocationsTableViewController ()

@property (nonatomic) NSArray* ListOfLocationsArray;

@end

@implementation ListOfLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ListOfLocationsArray = @[@"Waldorf Astoria", @"Rockefeller Center", @"Wave Hill"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ListOfLocationsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.ListOfLocationsArray[indexPath.row];
    
    
    
    return cell;
}


//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//   
//    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    self.selectedQuery = selectedCell.detailTextLabel.text;
//    
//    NSLog(@"%@", self.selectedQuery);
//}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    DetailLocationViewController* viewController = segue.destinationViewController;
    viewController.queryPhrase = self.ListOfLocationsArray[indexPath.row];
   
    
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
