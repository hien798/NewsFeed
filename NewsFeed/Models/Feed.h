//
//  Feed.h
//  NewsFeed
//
//  Created by Hiên on 9/12/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FeedPreviewType) {
    FeedPreviewTypeImage,
    FeedPreviewTypeVideo,
    FeedPreviewTypeUrl,
    FeedPreviewTypeNone
};

@interface Feed : NSObject

@property (nonatomic, readonly) NSString *userName;
@property (nonatomic, readonly) NSString *time;
@property (nonatomic) NSString *textContent;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSInteger like;
@property (nonatomic) NSInteger comment;
@property (nonatomic) FeedPreviewType feedPreviewType;

- (instancetype)initWithContent:(NSString *)textContent
                          media:(NSString *)imageUrl
                           like:(NSInteger)like
                        comment:(NSInteger)comment
                           user:(NSString *)userName
                         atTime:(NSString *)time;

- (instancetype)initWithContent:(NSString *)textContent
                          media:(NSString *)imageUrl
                           user:(NSString *)userName
                         atTime:(NSString *)time;

@end
