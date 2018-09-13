//
//  FeedContext.m
//  NewsFeed
//
//  Created by Hiên on 9/11/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "FeedContext.h"

@implementation FeedContext

- (instancetype)initWithImageNames:(NSSet<NSString *> *)imageNames {
    if (self = [super init]) {
        _images = loadImages(imageNames);
    }
    return self;
}

- (UIImage *)randomImage {    
    return _images[arc4random_uniform((uint32_t)_images.count)];
}

static NSArray<UIImage *> *loadImages(NSSet *imageNames)
{
    NSMutableArray<UIImage *> *images = [NSMutableArray new];
    for (NSString *imageName in imageNames) {
        UIImage *image = [UIImage imageNamed:imageName];
        if (image) {
            [images addObject:image];
        }
    }
    return images;
}



@end
