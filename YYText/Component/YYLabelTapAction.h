//
//  YYLabelTapAction.h
//  YYText
//
//  Created by feirisu on 2023/5/29.
//  Copyright © 2023 ibireme. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<YYText/YYText.h>)
#import <YYText/YYTextAttribute.h>
#import <YYText/YYTextInput.h>
#else
#import "YYTextAttribute.h"
#import "YYTextInput.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YYLabelTextType) {
    YYLabelTextType_None,
    YYLabelTextType_Link,
};

typedef void(^tapActionBlock)(YYLabelTextType type, NSString *text, NSString *linkURL);

@interface YYLabelTapAction : NSObject

+ (YYTextAction)tapActionWith:(YYLabelTextType)type block:(tapActionBlock)block;

@end

NS_ASSUME_NONNULL_END
