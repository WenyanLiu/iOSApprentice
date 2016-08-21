//
//  ListTableViewController.m
//  QQList
//
//  Created by 刘文炎 on 8/21/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ListTableViewController.h"
#import "GroupModel.h"
#import "FriendModel.h"

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ListTableViewController

- (NSArray *)dataArr {
    if (!_dataArr) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Friends" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSDictionary *dict in arr) {
            GroupModel *groupModel = [GroupModel groupWithDict:dict];
            [arrM addObject:groupModel];
        }
        self.dataArr = [arrM copy];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *groupModel = self.dataArr[section];
    NSInteger c = groupModel.isExpand ? groupModel.friends.count : 0;
    return c;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"friendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    GroupModel *groupModel = self.dataArr[indexPath.section];
    FriendModel *friendModel = groupModel.friends[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:friendModel.icon];
    cell.textLabel.text = friendModel.name;
    cell.detailTextLabel.text = friendModel.intro;
    return cell;
}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
