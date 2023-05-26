//
//  YYLabel+TapAction.h
//  Wolf
//
//  Created by FanLang on 2022/1/1.
//  Copyright © 2022年 com.beihai.fanlang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYLabel.h>

typedef NS_ENUM(NSInteger, YYLabelTextType) {
    YYLabelTextType_None,
    YYLabelTextType_Link,
};

typedef void(^tapActionBlock)(YYLabelTextType type, NSString *text, NSString *linkURL);

@interface YYLabelTapAction : NSObject

+ (YYTextAction)tapActionWith:(YYLabelTextType)type block:(tapActionBlock)block;

@end
