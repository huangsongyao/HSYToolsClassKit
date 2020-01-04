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
#import "HYSWindows.h" 
#import <HSYMacroKit/HSYToolsMacro.h>
#import <HSYMethodsToolsKit/RACSignal+Convenients.h>
#import <HSYMethodsToolsKit/UIButton+UIKit.h>
#import "HSYAirgasWindows.h"
#import "HSYProgressHUDTools.h"

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
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    [tapGesture addTarget:self action:@selector(test:)];
    [self.view addGestureRecognizer:tapGesture];
    [HSYGestureTools hsy_tapGesture:self.view touchTapGestureBlock:^(UIGestureRecognizer * _Nonnull gesture, UIView * _Nonnull touchView, CGPoint location) {
        [HSYProgressHUDTools hsy_showMessageProgressHUD:@"23232的各个人二维个王二狗而二个人高僧二哥二个人个人股serger色如果设若干色弱个人sergerserger阿尔高色二哥二哥sergersergerserger二哥二哥sergerserger色如果是二哥sergersergerserger色管人事"];
//        [HYSWindows hsy_defaultWindows:^RACSignal *(HYSWindows * _Nonnull windows) {
//            CGFloat x = 50.0f;
//            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, (IPHONE_WIDTH - x * 2.0f), IPHONE_WIDTH)];
//            view.backgroundColor = UIColor.greenColor;
//            UIButton *button = [UIButton hsy_buttonWithAction:^(UIButton * _Nonnull button) {
//                UIView *blackView = [[UIView alloc] initWithFrame:button.bounds];
//                blackView.backgroundColor = UIColor.grayColor;
//                [HSYProgressHUDTools hsy_showMessageProgressHUD:@"23232"];
//            }];
//            button.frame = view.bounds;
//            [view addSubview:button];
//            return [RACSignal hsy_sendTupleSignal:RACTuplePack(view)];
//        }];
    }];
    
//    [HSYGestureTools hsy_tapGesture:self.view touchTapGestureBlock:^(UIGestureRecognizer * _Nonnull gesture, UIView * _Nonnull touchView, CGPoint location) {
//
//        HSYAirgasWindowsArgument *argument = [[HSYAirgasWindowsArgument alloc] init];
////        argument.state = kHSYAirgasWindowsStateToRight;
////        argument.position = CGPointMake(IPHONE_WIDTH/5.0, 500);
//
////        argument.state = kHSYAirgasWindowsStateToLeft;
////        argument.position = CGPointMake(IPHONE_WIDTH - IPHONE_WIDTH/5.0, 500);
//
////        argument.state = kHSYAirgasWindowsStateToTop;
////        argument.position = CGPointMake(IPHONE_WIDTH/2.0f, 500);
//
//        argument.state = kHSYAirgasWindowsStateToBottom;
//        argument.position = CGPointMake(IPHONE_WIDTH/2.0f, 500);
//
//        HSYAirgasWindows *airgasWindow = [[HSYAirgasWindows alloc] initWithArgument:argument];
//        [airgasWindow hsy_showAirgas];
//    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)test:(id)sender
{
    NSLog(@"sender => %@", sender);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
