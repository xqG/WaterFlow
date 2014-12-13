//
//  XqShopCell.m
//  UICollectionView瀑布流
//
//  Created by 高新强 on 14/12/12.
//  Copyright (c) 2014年 Gxq. All rights reserved.
//

#import "XqShopCell.h"
#import "XqShopModel.h"
#import "UIImageView+WebCache.h"

@interface XqShopCell()
/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/**
 *  价格
 */
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end


@implementation XqShopCell

/**
 *  给图片加上边框,圆角
 */
- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 3;
    self.imageView.clipsToBounds = YES;
}

-(void)setShop:(XqShopModel *)shop
{
    _shop = shop;
    // 1.图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    // 2.价格
    self.priceLabel.text = shop.price;
}



@end
