//
//  XqWaterFlowLayer.h
//  UICollectionView瀑布流
//
//  Created by 高新强 on 14/12/12.
//  Copyright (c) 2014年 Gxq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XqWaterFlowLayer;

@protocol XqWaterflowLayoutDelegate <NSObject>
- (CGFloat)waterflowLayout:(XqWaterFlowLayer *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;
@end



@interface XqWaterFlowLayer : UICollectionViewLayout


@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<XqWaterflowLayoutDelegate> delegate;



@end
