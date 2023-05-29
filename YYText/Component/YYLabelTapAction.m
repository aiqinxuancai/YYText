//
//  YYLabelTapAction.m
//  YYText
//
//  Created by feirisu on 2023/5/29.
//  Copyright © 2023 ibireme. All rights reserved.
//

#import "YYLabelTapAction.h"

@implementation YYLabelTapAction

+ (YYTextAction)tapActionWith:(YYLabelTextType)type block:(tapActionBlock)block {
    return ^void(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [text enumerateAttribute:[[self class] YYLabelTextAttributedNameWith:type] inRange:range options:NSAttributedStringEnumerationReverse usingBlock:^(id _Nullable value, NSRange range, BOOL *_Nonnull stop) {
            if (value != nil) {
                NSString *subText = [text.string substringWithRange:range];
                NSAttributedString *subAttribute = [text attributedSubstringFromRange:range];
                NSString *link = [self linkInAttributeString:subAttribute];

                if (block) {
                    block(type, subText, link);
                }
                *stop = YES;
            }
        }];
    };
}

+ (NSString *)linkInAttributeString:(NSAttributedString *)text {
    __block NSString *link = nil;
    NSRange range = NSMakeRange(0, text.string.length);
    [text enumerateAttribute:NSLinkAttributeName inRange:range options:NSAttributedStringEnumerationReverse usingBlock:^(id _Nullable value, NSRange range, BOOL *_Nonnull stop) {
        if (value != nil) {
            link = value;
            *stop = YES;
        }
    }];
    return link;
}

+ (NSString *)YYLabelTextAttributedNameWith:(YYLabelTextType)type {
    NSString *attrName = nil;
    switch (type) {
        case YYLabelTextType_Link:
            attrName = NSUnderlineStyleAttributeName;
            break;
        default:
            break;
    }
    return attrName;
}

@end
