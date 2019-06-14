//
//  ShareItem.m
//  XueChu
//
//  Created by targetios on 2018/7/27.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import "ShareItem.h"

@implementation ShareItem

- (instancetype)initWithShareType:(ShareType)shareType
{
    if (self = [super init])
    {
        switch (shareType)
        {
            case ShareTypeWeibo:
                self.title = @"新浪微博";
                self.iconName = @"53";
                self.iconNameHighLight = @"53";
                self.platformType = UMSocialPlatformType_Sina;
                break;
            case ShareTypeWeChat:
                self.title = @"微信好友";
                self.iconName = @"52-1";
                self.iconNameHighLight = @"52-1";
                self.platformType = UMSocialPlatformType_WechatSession;
                break;
            case ShareTypeWeChatTimeline:
                self.title = @"朋友圈";
                self.iconName = @"54";
                self.iconNameHighLight = @"54";
                self.platformType = UMSocialPlatformType_WechatTimeLine;
                break;
            case ShareTypeQQ:
                self.title = @"QQ";
                self.iconName = @"55";
                self.iconNameHighLight = @"55";
                self.platformType = UMSocialPlatformType_QQ;

                break;
            case ShareTypeQzone:
                self.title = @"QQ空间";
                self.iconName = @"53";
                self.iconNameHighLight = @"53";
                self.platformType = UMSocialPlatformType_Qzone;
                
                break;
                
            default:
                break;
        }
    }
    
    return self;
}

@end
