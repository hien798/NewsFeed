//
//  CKNetworkImageDownloader.m
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "CKNetworkImageDownloader.h"
#import <UIKit/UIKit.h>

@implementation CKNetworkImageDownloader

static NSCache<NSString *, UIImage *> *shareCache;

+ (instancetype)sharedInstance {
    static CKNetworkImageDownloader *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - <CKNetworkImageDownloading>

- (id)downloadImageWithURL:(NSURL *)URL
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion {
    
    if (!shareCache) {
        shareCache = [[NSCache alloc] init];
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        
        UIImage *img = [shareCache objectForKey:[URL absoluteString]];
        if (img) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion([img CGImage], nil);
                }
            });
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:URL];
        CGImageRef image;
        if (data) {
            UIImage *imgToCache = [UIImage imageWithData:data];
            image = [imgToCache CGImage];
            [shareCache setObject:imgToCache forKey:[URL absoluteString]];
        } else {
            image = [[UIImage imageNamed:@"img-none"] CGImage];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(image, nil);
            }
        });
    });
    return self;
}

- (void)cancelImageDownload:(id)download {
    NSLog(@"Cancel Download!");
}

@end
