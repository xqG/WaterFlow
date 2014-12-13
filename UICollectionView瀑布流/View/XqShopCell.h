//
//  XqShopCell.h
//  UICollectionView瀑布流
//
//  Created by 高新强 on 14/12/12.
//  Copyright (c) 2014年 Gxq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XqShopModel;

@interface XqShopCell : UICollectionViewCell

/**
 *  商品模型
 */
@property (nonatomic, strong) XqShopModel *shop;

@end
