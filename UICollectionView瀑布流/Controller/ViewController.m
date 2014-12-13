//
//  ViewController.m
//  UICollectionView瀑布流
//
//  Created by 高新强 on 14/12/12.
//  Copyright (c) 2014年 Gxq. All rights reserved.
//

#import "ViewController.h"

#import "MJRefresh.h"
#import "MJExtension.h"
#import "XqWaterFlowLayer.h"
#import "XqShopCell.h"
#import "XqShopModel.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,XqWaterflowLayoutDelegate>
/**
 *  Collection
 */
@property (nonatomic, weak) UICollectionView *collectionView;
/**
 *  存放商品模型的数组
 */
@property (nonatomic, strong) NSMutableArray *shops;


@end

@implementation ViewController

/**
 *  懒加载
 */
- (NSMutableArray *)shops
{
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

static NSString *const ID = @"shop";


- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.初始化数据
    NSArray *shopArray = [XqShopModel objectArrayWithFilename:@"1.plist"];
    [self.shops addObjectsFromArray:shopArray];
    
    
    //创建
    XqWaterFlowLayer *layout = [[XqWaterFlowLayer alloc] init];
    layout.delegate = self;

    
    // 2.创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"XqShopCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    [collectionView setBackgroundColor:[UIColor blackColor]];
    self.collectionView = collectionView;
    
    // 3.增加刷新控件
    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreShops)];
}


/**
 *  加载更多数据...
 */
- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *shopArray = [XqShopModel objectArrayWithFilename:@"1.plist"];
        [self.shops addObjectsFromArray:shopArray];
        [self.collectionView reloadData];
        [self.collectionView footerEndRefreshing];
    });
}

#pragma mark - <WaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(XqWaterFlowLayer *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    XqShopModel *shop = self.shops[indexPath.item];
    return shop.h / shop.w * width;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

/**
 *  返回自定义的cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XqShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
}




@end
