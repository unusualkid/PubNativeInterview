//
//  TaskViewController.h
//  PubNativeInterview
//
//  Created by Kenneth Chen on 7/21/20.
//  Copyright © 2020 Ramen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TaskViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *creationDateLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;

@property NSString *description;

@end

NS_ASSUME_NONNULL_END
