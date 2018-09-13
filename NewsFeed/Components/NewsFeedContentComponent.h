//
//  NewsFeedContentComponent.h
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>
#import "Feed.h"
#import "FeedContext.h"

@interface NewsFeedContentComponent : CKCompositeComponent

+ (instancetype)newWithFeed:(Feed *)feed context:(FeedContext *)context;

@end
