//
//  NewsFeedContentComponent.m
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedContentComponent.h"
#import "NewsFeedMediaContentComponent.h"

@implementation NewsFeedContentComponent

+ (instancetype)newWithFeed:(Feed *)feed context:(FeedContext *)context {
    return [super newWithComponent:
            [CKFlexboxComponent
             newWithView:{}
             size:{}
             style:{}
             children:{
                 {
                     // Text
                     [CKInsetComponent
                      newWithInsets:{}
                      component:
                      [CKTextComponent
                       newWithTextAttributes:{
                           .attributedString = [[NSAttributedString alloc]
                                                initWithString:feed.textContent
                                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}],
                       }
                       viewAttributes:{}
                       options:{}
                       size:{}]]
                 },
                 {
                     // Image
                     [NewsFeedMediaContentComponent
                      newWithFeed:feed context:context]
                 },
             }]];
}

@end
