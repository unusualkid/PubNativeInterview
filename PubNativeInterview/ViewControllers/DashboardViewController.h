//
//  DashboardViewController.h
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/20/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, strong) NSMutableArray *tableData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

