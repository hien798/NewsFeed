//
//  CKNetworkImageDownloader.h
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

@interface CKNetworkImageDownloader : NSObject <CKNetworkImageDownloading>

+ (instancetype)sharedInstance;

@end
