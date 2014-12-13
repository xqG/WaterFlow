//
//  XqShopModel.h
//  UICollectionView瀑布流
//
//  Created by 高新强 on 14/12/12.
//  Copyright (c) 2014年 Gxq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XqShopModel : NSObject

/**
 *  图片的宽
 */
@property (nonatomic, assign) CGFloat w;
/**
 * 图片高度
 */
@property (nonatomic, assign) CGFloat h;
/**
 *  图片名称
 */
@property (nonatomic, copy) NSString *img;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;


@end
