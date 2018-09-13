//
//  FeedContext.h
//  NewsFeed
//
//  Created by Hiên on 9/11/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FeedContext : NSObject
@property (nonatomic) NSArray<UIImage *> *images;
- (instancetype)initWithImageNames:(NSSet<NSString *> *)imageNames;
- (UIImage *)randomImage;
@end
