//
//  NewsFeedHeaderComponent.m
//  NewsFeed
//
//  Created by Hiên on 9/13/18.
//  Copyright © 2018 Hiên. All rights reserved.
//

#import "NewsFeedHeaderComponent.h"

@implementation NewsFeedHeaderComponent

+ (instancetype)newWithName:(NSString *)name avatar:(UIImage *)image time:(NSString *)time {
    return [super newWithComponent:
            [CKFlexboxComponent
             newWithView:{}
             size:{}
             style:{
                 .direction = CKFlexboxDirectionRow,
                 .spacing = 10,
                 .alignItems = CKFlexboxAlignItemsCenter,
             }
             children:{
                 {
                     // Avatar
                     [CKInsetComponent
                      newWithInsets:{}
                      component:
                      [CKImageComponent
                       newWithImage:image
                       attributes:{
                           {CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @20.0},
                           {CKComponentViewAttribute::LayerAttribute(@selector(setBorderWidth:)), @1.0},
                           {CKComponentViewAttribute::LayerAttribute(@selector(setBorderColor:)), [UIColor cyanColor]},
                           {@selector(setContentMode:), UIViewContentModeScaleAspectFill},
                           {@selector(setClipsToBounds:), @YES},
                       }
                       size:{.width = 40, .height = 40}]]
                 },
                 {
                     // Name and time
                     [CKInsetComponent
                      newWithInsets:{}
                      component:
                      [CKFlexboxComponent
                       newWithView:{}
                       size:{}
                       style:{}
                       children:{
                           {
                               // Name
                               [CKInsetComponent
                                newWithInsets:{}
                                component:
                                [CKLabelComponent
                                 newWithLabelAttributes:{
                                     .string = name,
                                     .color = [UIColor blackColor],
                                     .font = [UIFont boldSystemFontOfSize:15],
                                 }
                                 viewAttributes:{}
                                 size:{}]]
                           },
                           {
                               // Time
                               [CKInsetComponent
                                newWithInsets:{}
                                component:
                                [CKLabelComponent
                                 newWithLabelAttributes:{
                                     .string = time,
                                     .color = [UIColor lightGrayColor],
                                     .font = [UIFont systemFontOfSize:12],
                                 }
                                 viewAttributes:{}
                                 size:{}]]
                           },
                       }]]
                 },
             }]];
}

@end
