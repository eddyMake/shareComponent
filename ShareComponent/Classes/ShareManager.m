//
//  ShareManager.m
//  XueChu
//
//  Created by targetios on 2018/7/27.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import "ShareManager.h"
#import "ShareView.h"
#import <UMShare/UMShare.h>

@interface ShareManager()

@property (nonatomic, strong) ShareConfiguration *shareConfiguration;

@end

@implementation ShareManager

+ (ShareManager *)shareManager
{
    static ShareManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[[self class] alloc] init];
    });
    
    return sharedManager;
}

- (void)showInViewController:(UIViewController *)viewController shareConfiguration:(ShareConfiguration *)shareConfiguration
{
    if (shareConfiguration == nil)
    {
        shareConfiguration = [ShareConfiguration defaultConfiguration];
    }
    
    self.shareConfiguration = shareConfiguration;
    
    [ShareView showShareViewWithShareConfiguration:shareConfiguration selectedHandler:^(ShareItem *shareItem) {
       
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareConfiguration.title descr:shareConfiguration.content thumImage:shareConfiguration.imageUrlString];
        shareObject.webpageUrl = shareConfiguration.linkUrlString;

        messageObject.shareObject = shareObject;

        //调用分享接口
        [[UMSocialManager defaultManager] shareToPlatform:shareItem.platformType messageObject:messageObject currentViewController:viewController completion:^(id data, NSError *error) {

            if (error)
            {
                UMSocialLogInfo(@"************Share fail with error %@*********",error);
            }
            else
            {
                [HUDHelper showTip:@"分享成功"];
                
                if ([data isKindOfClass:[UMSocialShareResponse class]])
                {
                    UMSocialShareResponse *resp = data;
                    //分享结果消息
                    UMSocialLogInfo(@"response message is %@",resp.message);
                    //第三方原始返回的数据
                    UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                }
                else
                {
                    UMSocialLogInfo(@"response data is %@",data);
                }
            }
        }];
        
    } dismissHandler:^{
        
    }];
}

- (void)hideShareView
{
    [ShareView hideShareView];
}

@end
