//
//  NewsFeedComponent.m
//  NewsFeed
//
//  Created by Hiên on 9/12/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedComponent.h"
#import "NewsFeedHeaderComponent.h"
#import "NewsFeedContentComponent.h"
#import "NewsFeedFooterComponent.h"

@implementation NewsFeedComponent

+ (instancetype)newWithFeed:(Feed *)feed context:(FeedContext *)context {
    return [super newWithComponent:
     [CKBackgroundLayoutComponent
      newWithComponent:
      [CKInsetComponent
       newWithInsets:{.top = 10, .bottom = 10, .left = 10, .right = 10}
       component:
       [CKFlexboxComponent
        newWithView:{}
        size:{}
        style:{
            .direction = CKFlexboxDirectionColumn,
            .spacing = 10,
        }
        children:{
            {
                // Header
                [CKInsetComponent
                 newWithInsets:{}
                 component:
                 [NewsFeedHeaderComponent
                  newWithName:feed.userName
                  avatar:[context randomImage]
                  time:feed.time]]
            },
            {
                // Body
                [CKInsetComponent
                 newWithInsets:{}
                 component:
                 [NewsFeedContentComponent
                  newWithFeed:feed context:context]],
            },
            {
                // Footer
                [CKInsetComponent
                 newWithInsets:{}
                 component:
                 [NewsFeedFooterComponent
                  newWithLike:feed.like
                  comment:feed.comment]],
            },
        }]]
      background:
      [CKComponent
       newWithView:{
           [UIView class],
           {
               {@selector(setBackgroundColor:), [UIColor whiteColor]},
           }
       }
       size:{}]
      ]];
}

@end
