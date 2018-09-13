//
//  NewsFeedFooterComponent.m
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedFooterComponent.h"
#import "UIImage+Color.h"

@implementation NewsFeedFooterComponent

+ (instancetype)newWithLike:(NSInteger)like comment:(NSInteger)comment {
    return [super newWithComponent:
            [CKFlexboxComponent
             newWithView:{}
             size:{}
             style:{.spacing = 10}
             children:{
                 {
                     // Line
                     [CKImageComponent
                      newWithImage:[UIImage imageWithColor:[UIColor colorWithWhite:0.95f alpha:1.0f] size:CGSizeMake(200, 10)]
                      attributes:{}
                      size:{[UIScreen mainScreen].bounds.size.width - 20, 1.0}]
                 },
                 {
                     // Footer Content
                     [CKFlexboxComponent
                      newWithView:{}
                      size:{}
                      style:{
                          .direction = CKFlexboxDirectionRow,
                          .spacing = 20,
                      }
                      children:{
                          {
                              // Like
                              [CKInsetComponent
                               newWithInsets:{}
                               component:
                               [CKFlexboxComponent
                                newWithView:{}
                                size:{}
                                style:{
                                    .direction = CKFlexboxDirectionRow,
                                    .spacing = 3,
                                    .alignItems = CKFlexboxAlignItemsCenter,
                                }
                                children:{
                                    {
                                        // Image
                                        [CKImageComponent
                                         newWithImage:[UIImage imageNamed:@"ic-like"]
                                         attributes:{
                                             {@selector(setContentMode:), UIViewContentModeScaleAspectFit},
                                         }
                                         size:{.height = 20, .minWidth = 20}]
                                    },
                                    {
                                        // Count
                                        [CKLabelComponent
                                         newWithLabelAttributes:{
                                             .string = [NSString stringWithFormat:@"%ld", like],
                                             .color = [UIColor grayColor],
                                             .font = [UIFont systemFontOfSize:12],
                                         }
                                         viewAttributes:{}
                                         size:{}],
                                    },
                                }]]
                          },
                          {
                              // Comment
                              [CKInsetComponent
                               newWithInsets:{}
                               component:
                               [CKFlexboxComponent
                                newWithView:{}
                                size:{}
                                style:{
                                    .direction = CKFlexboxDirectionRow,
                                    .spacing = 3,
                                }
                                children:{
                                    {
                                        // Image
                                        [CKImageComponent
                                         newWithImage:[UIImage imageNamed:@"ic-comment"]
                                         attributes:{
                                             {@selector(setContentMode:), UIViewContentModeScaleAspectFit},
                                         }
                                         size:{.height = 20, .minWidth = 20}]
                                    },
                                    {
                                        // Count
                                        [CKLabelComponent
                                         newWithLabelAttributes:{
                                             .string = [NSString stringWithFormat:@"%ld", like],
                                             .color = [UIColor grayColor],
                                             .font = [UIFont systemFontOfSize:12],
                                         }
                                         viewAttributes:{}
                                         size:{}],
                                    },
                                }]]
                          },
                          {
                              // Share
                              [CKInsetComponent
                               newWithInsets:{}
                               component:
                               [CKImageComponent
                                newWithImage:[UIImage imageNamed:@"ic-share"]
                                attributes:{
                                    {@selector(setContentMode:), UIViewContentModeScaleAspectFit},
                                }
                                size:{.height = 20, .minWidth = 20}]]
                          },
                      }]
                 }
             }]];
}

@end
