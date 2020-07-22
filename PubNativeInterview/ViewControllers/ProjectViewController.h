//
//  ProjectViewController.h
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/21/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProjectViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
