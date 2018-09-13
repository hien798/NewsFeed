//
//  NewsFeedMediaContentComponent.m
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedMediaContentComponent.h"
#import "CKNetworkImageDownloader.h"


@interface NewsFeedMediaContentComponent()

@end

@implementation NewsFeedMediaContentComponent

+ (instancetype)newWithFeed:(Feed *)feed context:(FeedContext *)context {
    switch (feed.feedPreviewType) {
        case FeedPreviewTypeImage:
        {
            return [super newWithComponent:
                    [CKInsetComponent
                     newWithInsets:{.top = 10, .left = -10, .right = -10}
                     component:
                     [CKRatioLayoutComponent
                      newWithRatio:1.0f
                      size:{}
                      component:
                      [CKNetworkImageComponent
                       newWithURL:[NSURL URLWithString:feed.imageUrl]
                       imageDownloader:[CKNetworkImageDownloader sharedInstance]
                       size:{1,1}
                       options:{
                           //.defaultImage = [UIImage imageNamed:@"img-none"],
                       }
                       attributes:{
                           {@selector(setContentMode:), UIViewContentModeScaleAspectFill},
                           {@selector(setClipsToBounds:), @YES},
                       }]]]];
        }
        case FeedPreviewTypeVideo:
        {
            return nil;
        }
        case FeedPreviewTypeUrl:
        {
            return nil;
        }
        default:
        {
            // None or others
            return nil;
        }
    }
}

@end
