//
//  HSYProgressHUDTools.m
//  HSYToolsClassKit
//
//  Created by anmin on 2020/1/3.
//

#import "HSYProgressHUDTools.h"
#import <HSYMethodsToolsKit/UIApplication+AppDelegates.h>
#import <HSYMacroKit/HSYToolsMacro.h>
#import <HSYMethodsToolsKit/RACSignal+Convenients.h>
#import <HSYMethodsToolsKit/NSString+StringSize.h>
#import <HSYMethodsToolsKit/UIView+Frame.h>

CGFloat const kHSYProgressHUDToolsMessageDelays = 2.0f;

@implementation HSYProgressHUDTools

#pragma mark - MBProgressHUD IN Window

+ (UIWindow *)hsy_progressHUDInWindow
{
    return UIApplication.hsy_keyWindows;
}

#pragma mark - Created MBProgressHUD

+ (MBProgressHUD *)hsy_showProgressHUD:(UIView *)detailsContentView
                   progressHUDFromView:(UIView *)view
                            afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    progressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;//设置纯色背景模式
    progressHUD.bezelView.backgroundColor = [HSY_HEX_COLOR(0x000000) colorWithAlphaComponent:0.8f];//main窗口的背景色
    progressHUD.bezelView.layer.cornerRadius = 5.0f;//main窗口的圆角
    progressHUD.mode = MBProgressHUDModeCustomView;//设置MBProgressHUD的模式为自定义main视图模式
    progressHUD.animationType = MBProgressHUDAnimationZoom;//设置动画为放缩方式
    progressHUD.graceTime = 1.35f;//防止MBProgressHUD时间过短的预留时间
    progressHUD.customView = detailsContentView;//添加自定义的main窗口
    if (delay > 0.0f) {
        //如果delay参数大于0.0，则延迟delay的时间调用hidden方法将MBProgressHUD从window上移除
        [HSYProgressHUDTools hsy_hiddenProgressHUDForView:view afterDelay:delay];
    }
    
    return progressHUD;
}

+ (MBProgressHUD *)hsy_showProgressHUD:(UIView *)detailsContentView
                            afterDelay:(NSTimeInterval)delay
{
    return [HSYProgressHUDTools hsy_showProgressHUD:detailsContentView
                                progressHUDFromView:HSYProgressHUDTools.hsy_progressHUDInWindow
                                         afterDelay:delay];
}

#pragma mark - Remove MBProgressHUD

+ (void)hsy_hiddenProgressHUDForView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    [[RACScheduler mainThreadScheduler] afterDelay:delay schedule:^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    }];
}

+ (void)hsy_hiddenProgressHUD:(NSTimeInterval)delay
{
    [HSYProgressHUDTools hsy_hiddenProgressHUDForView:HSYProgressHUDTools.hsy_progressHUDInWindow afterDelay:delay];
}

+ (void)hsy_hiddenProgressHUDForView:(UIView *)view
{
    [HSYProgressHUDTools hsy_hiddenProgressHUDForView:view afterDelay:0.0f];
}

#pragma mark - Custom Message

+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message
                          progressHUDFromView:(UIView *)view
                                   afterDelay:(NSTimeInterval)delay
{
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.textColor = UIColor.whiteColor;
    messageLabel.font = HSY_SYSTEM_FONT_SIZE(15);
    messageLabel.numberOfLines = 0;
    messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    messageLabel.text = message;
    CGFloat lefts = 35.0f;
    CGFloat tops = 40.0f;
    CGSize size = [messageLabel.text hsy_boundingRectWithSize:CGSizeMake((IPHONE_WIDTH - lefts * 2.0f), (IPHONE_HEIGHT - tops * 2.0f)) font:messageLabel.font];
    messageLabel.size = size;
    
    return [HSYProgressHUDTools hsy_showProgressHUD:messageLabel progressHUDFromView:view afterDelay:delay];
} 

+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message afterDelay:(NSTimeInterval)delay
{
    return [HSYProgressHUDTools hsy_showMessageProgressHUD:message progressHUDFromView:HSYProgressHUDTools.hsy_progressHUDInWindow afterDelay:delay];
}

+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message
{
    return [HSYProgressHUDTools hsy_showMessageProgressHUD:message afterDelay:kHSYProgressHUDToolsMessageDelays];
}

@end
