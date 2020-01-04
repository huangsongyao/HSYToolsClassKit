//
//  HSYProgressHUDTools.h
//  HSYToolsClassKit
//
//  Created by anmin on 2020/1/3.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const kHSYProgressHUDToolsMessageDelays;

@interface HSYProgressHUDTools : NSObject

+ (UIWindow *)hsy_progressHUDInWindow;
+ (MBProgressHUD *)hsy_showProgressHUD:(UIView *)detailsContentView
                   progressHUDFromView:(UIView *)view
                            afterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)hsy_showProgressHUD:(UIView *)detailsContentView
                            afterDelay:(NSTimeInterval)delay;
+ (void)hsy_hiddenProgressHUDForView:(UIView *)view afterDelay:(NSTimeInterval)delay;
+ (void)hsy_hiddenProgressHUD:(NSTimeInterval)delay;
+ (void)hsy_hiddenProgressHUDForView:(UIView *)view;
+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message
                          progressHUDFromView:(UIView *)view
                                   afterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message afterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)hsy_showMessageProgressHUD:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
