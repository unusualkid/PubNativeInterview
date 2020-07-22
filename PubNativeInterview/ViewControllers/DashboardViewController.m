//
//  DashboardViewController.m
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/20/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import "DashboardViewController.h"
#import "ProjectViewController.h"
#import "AddProjectViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

NSMutableArray *projects;
NSString *CellIdentifier = @"DashboardTableCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Dashboard";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]init];
    addButton.action = @selector(addProject:);
    addButton.title = @"Add project";
    addButton.target = self;
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    NSMutableArray *projects = [NSMutableArray new];
    
    NSMutableArray *project1 = [NSMutableArray new];
    NSMutableDictionary *taskDictionary1 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"fix keyboard bug", @"title", @"the keyboard covers up the text field when user clicks on the text field.", @"description", @"11/11/20", @"creationDate", [NSMutableArray new], @"comments",nil];
        NSMutableDictionary *taskDictionary2 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Add nav bar button", @"title", @"Add add task button to nav bar right.", @"description", @"11/12/20", @"creationDate", [NSMutableArray new], @"comments",nil];
    [project1 addObject:taskDictionary1];
    [project1 addObject:taskDictionary2];
    
    NSMutableArray *project2 = [NSMutableArray new];
    NSMutableDictionary *taskDictionary3 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"fix keyboard bug", @"title", @"the keyboard covers up the text field when user clicks on the text field.", @"description", @"11/11/20", @"creationDate", [NSMutableArray new], @"comments",nil];
        NSMutableDictionary *taskDictionary4 = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Add nav bar button", @"title", @"Add add task button to nav bar right.", @"description", @"11/12/20", @"creationDate", [NSMutableArray new], @"comments",nil];
    [project2 addObject:taskDictionary3];
    [project2 addObject:taskDictionary4];
    
    [projects addObject:project1];
    [projects addObject:project2];
    NSLog(@"projects: %@", projects);
    NSLog(@"taskDictionary: %@", taskDictionary1);
    //    projects = [[NSMutableArray alloc]initWithObjects:
    //              @"Fix keyboard not scrolling up bug",@"Show project create time",@"Hyderabad",
    //              @"Add UI to projects",@"Add project creator",@"Add filter feature",
    //              @"Facebook ad",@"Weekly blog post",@"Do white paper",
    //              @"Reach out to news channels",@"Startup convention",@"Scout competitors", nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)addProject:(UIBarButtonItem *)sender {
    NSLog(@"Button pressed");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddProjectViewController *addProjectVC = [storyboard instantiateViewControllerWithIdentifier:@"AddProjectViewController"];
    
    // Display the view controller
    [self.navigationController pushViewController:addProjectVC animated:YES];
}

#pragma mark - TableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [projects count]/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = projects[indexPath.row];
    NSString *stringForCell;
    if (indexPath.section == 0) {
        stringForCell= [projects objectAtIndex:indexPath.row];
        
    }
    else if (indexPath.section == 1){
        stringForCell= [projects objectAtIndex:indexPath.row+ [projects count]/2];
        
    }
    
    [cell.textLabel setText:stringForCell];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Tech";
    }
    else {
        headerTitle = @"Business";
    }
    
    return headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
(NSInteger)section{
    NSString *footerTitle;
    if (section==0) {
        footerTitle = @"\n";
    }
    else {
        footerTitle = @"\n";
    }
    return footerTitle;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"Section:%d Row:%d selected and the project is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProjectViewController *projectVC = [storyboard instantiateViewControllerWithIdentifier:@"ProjectViewController"];
    
    // Configure the view controller.
    projectVC.navigationItem.title = (@"%@",cell.textLabel.text);
    
    // Display the view controller
    [self.navigationController pushViewController:projectVC animated:YES];
}

@end
