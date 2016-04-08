//
//  TodayViewController.m
//  TodayExtension
//
//  Created by menglc on 16/2/22.
//  Copyright © 2016年 Meng. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController
{
    //
    IBOutlet UILabel *_oneLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    NSDate *date = [NSDate date];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    _oneLabel.text = [NSDateFormatter localizedStringFromDate:date dateStyle:(NSDateFormatterMediumStyle) timeStyle:(NSDateFormatterMediumStyle)];
    _oneLabel.backgroundColor = [UIColor magentaColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
