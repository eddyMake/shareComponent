//
//  ShareItem.h
//  XueChu
//
//  Created by targetios on 2018/7/27.
//  Copyright © 2018年 eddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

typedef NS_ENUM(NSInteger, ShareType) {
    ShareTypeWeibo = 4,
    ShareTypeWeChat = 0,
    ShareTypeWeChatTimeline = 1,
    ShareTypeQQ = 2,
    ShareTypeQzone = 3,
};

@interface ShareItem : NSObject

@property (nonatomic, assign) ShareType shareType;
@property (nonatomic, assign) UMSocialPlatformType platformType;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *iconNameHighLight;

- (instancetype)initWithShareType:(ShareType)shareType;

@end
