//
//  HSYViewController.m
//  HSYToolsClassKit
//
//  Created by 317398895@qq.com on 09/25/2019.
//  Copyright (c) 2019 317398895@qq.com. All rights reserved.
//

#import "HSYViewController.h"
#import "HYSDecimalNumber.h"
#import "HSYGestureTools.h"

@interface HSYViewController ()

@end

@implementation HSYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDecimalNumber *decimalNumber = [HYSDecimalNumber hsy_decimalString:@"11.11"];
    BOOL less = [decimalNumber hsy_lessThan:@"1.1"];
    BOOL greater = [decimalNumber hsy_greaterThan:@"1.1"];
    BOOL equal = [decimalNumber hsy_isEqualThan:@"1.1"];
    NSLog(@"less => %@, greater => %@, equal => %@", @(less), @(greater), @(equal));
    [HSYGestureTools hsy_tapGesture:self.view touchTapGestureBlock:^(UIGestureRecognizer * _Nonnull gesture, UIView * _Nonnull touchView, CGPoint location) {
        NSLog(@"touchView => %@, location => %@", touchView, NSStringFromCGPoint(location));
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
