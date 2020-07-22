//
//  ProjectViewController.m
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/21/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import "ProjectViewController.h"
#import "TaskViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController

NSMutableArray *tasks;
NSString *ProjectCellIdentifier = @"ProjectTableCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    tasks = [[NSMutableArray alloc]initWithObjects:
    @"Task1", @"Task2", @"Task3", nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ProjectCellIdentifier];
}

#pragma mark - TableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProjectCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = tasks[indexPath.row];
    NSString *stringForCell;
    if (indexPath.section == 0) {
        stringForCell= [tasks objectAtIndex:indexPath.row];
        
    }
    else if (indexPath.section == 1){
        stringForCell= [tasks objectAtIndex:indexPath.row+ [tasks count]/2];
        
    }

    [cell.textLabel setText:stringForCell];
    return cell;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"Section:%d Row:%d selected and the project is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TaskViewController *taskVC = [storyboard instantiateViewControllerWithIdentifier:@"TaskViewController"];
     
    // Configure the view controller.
    taskVC.navigationItem.title = cell.textLabel.text;
    taskVC.titleLabel.text = cell.textLabel.text;
    taskVC.creationDateLabel.text = @"11/11/20";
    taskVC.description = @"Hello, world";
    NSLog(@"cell.textLabel.text: %@", cell.textLabel.text);
    NSLog(@"taskVC.description: %@", taskVC.description);
    NSLog(@"taskVC.titleLabel.text: %@", taskVC.titleLabel.text);
    NSLog(@"taskVC.creationDateLabel.text: %@", taskVC.creationDateLabel.text);

    // Display the view controller
    [self.navigationController pushViewController:taskVC animated:YES];
}

@end
