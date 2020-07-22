//
//  AddProjectViewController.h
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/21/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddProjectViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *projectTextField;
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addButtonTapped:(id)sender;
@end

NS_ASSUME_NONNULL_END
