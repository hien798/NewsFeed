//
//  Feed.m
//  NewsFeed
//
//  Created by Hiên on 9/12/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (instancetype)initWithContent:(NSString *)textContent
                          media:(nullable NSString *)imageUrl
                           like:(NSInteger)like
                        comment:(NSInteger)comment
                           user:(NSString *)userName
                         atTime:(NSString *)time
{
    if (self = [super init]) {
        _feedPreviewType = FeedPreviewTypeNone;
        _userName = userName;
        _time = time;
        _textContent = textContent;
        self.imageUrl = imageUrl;
        _like = like;
        _comment = comment;
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    if (imageUrl) {
        _feedPreviewType = FeedPreviewTypeImage;
    }
}

- (instancetype)initWithContent:(NSString *)textContent
                          media:(nullable NSString *)imageUrl
                           user:(NSString *)userName
                         atTime:(NSString *)time
{
    return [self initWithContent:textContent
                           media:imageUrl
                            like:0
                         comment:0
                            user:userName
                          atTime:time];
}

@end
