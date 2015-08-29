//
//  LGTherapistScheduleHeaderView.m
//  ExtendView
//
//  Created by ZS on 15/8/21.
//  Copyright (c) 2015年 136ZS. All rights reserved.
//

#import "ScheduleHeaderView.h"
#import "Masonry.h"
#import "UIImage+imageForIBWithImageNamed.h"
#import "LGRelativePostionHelper.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0f green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0f blue:((float)(rgbValue & 0xFF)) / 255.0f alpha:1.0f]
IB_DESIGNABLE
@interface ScheduleHeaderView()
/**
 *  背景
 */
@property (nonatomic ,strong)UIImageView *backgroundImageView;
/**
 *  中心圆
 */
@property (nonatomic ,strong)UIImageView *centerImageView;
/**
 *  圆环
 */
@property (nonatomic ,strong)UIImageView *ringImageView;
/**
 *  "未来7天"label
 */
@property (nonatomic ,strong)UILabel *futurelabel;
/**
 *  "您有 个任务"label
 */
@property (nonatomic ,strong)UILabel *orderNumberLabel;
/**
 * 月数label
 */
@property (nonatomic ,strong)UILabel *monthLabel;
/**
 *“月”label
 */
@property (nonatomic ,strong)UILabel *showMonthLabel;
/**
 * 年数label
 */
@property (nonatomic ,strong)UILabel *yearLabel;
@end

@implementation ScheduleHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setupView];
    }
    return self;
}
-(void)setupView{
    //设置背景
    _backgroundImageView =  ({
        UIImageView   *imageView   = [[UIImageView alloc]init];
        imageView.image = [UIImage imageForIBWithImageNamed:@"bg_diamond_gallery_normal" classForBundle:[self class]];
        [self  addSubview:imageView];
        imageView;
    });
    
    //中心圆
    _centerImageView =  ({
        UIImageView   *imageView   = [[UIImageView alloc]init];
        imageView.image = [UIImage imageForIBWithImageNamed:@"bg_transparent_gallerynormal" classForBundle:[self class]];
        [self addSubview:imageView];
        imageView;
    });
    //圆环
    _ringImageView =  ({
        UIImageView   *imageView   = [[UIImageView alloc]init];
        imageView.image = [UIImage imageForIBWithImageNamed:@"bg_circle_gallery_normal" classForBundle:[self class]];
        [self addSubview:imageView];
        imageView;
    });
    //未来七天label
    _futurelabel  =  ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = UIColorFromRGB(0x1ca4a4);
        label.text = @"未来七天";
        [self addSubview:label];
        label;
    });
    //您有 笔任务
    _orderNumberLabel =  ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = UIColorFromRGB(0x1ca4a4);
        label.text = @"您有5个任务";
        [self addSubview:label];
        label;
    });
    
    
    _monthLabel =  ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:24];
        label.textColor = UIColorFromRGB(0xffffff);
        label.text = @"八";
        [self addSubview:label];
        label;
    });

    _showMonthLabel =  ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = UIColorFromRGB(0xffffff);
        label.text = @"月";
        [self addSubview:label];
        label;
    });
   
    _yearLabel = ({
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:24];
        label.textColor = UIColorFromRGB(0xffffff);
        label.text = @"2011";
        [self addSubview:label];
        label;
    });
    
    [self layout];
}
-(void)layout{
    
     __weak __typeof(self) weakSelf = self;
    //背景
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakSelf);
        make.center.mas_equalTo(weakSelf);
    }];
    //中心园
    [_centerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(220),RELATIVE_HEIGHT(220)));
    }];
    //圆环
    [_ringImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(RELATIVE_WIDTH(240), RELATIVE_HEIGHT(240)));
    }];
    //“未来七天”
    [_futurelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(weakSelf.mas_centerY);
    }];
    //订单数
    [_orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.mas_equalTo(weakSelf);
         make.top.mas_equalTo(weakSelf.mas_centerY);
    }];
    //月数
    [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(RELATIVE_X(30));
        make.bottom.mas_equalTo(weakSelf.mas_top).offset(RELATIVE_Y(48+30));
        make.height.mas_equalTo(RELATIVE_Y(48) )  ;
    }];
    //"月"
    [_showMonthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_monthLabel.mas_right).mas_equalTo(RELATIVE_X(12));
        make.bottom.mas_equalTo(weakSelf.mas_top).mas_equalTo(RELATIVE_HEIGHT(48+30));
    }];
    //年
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(RELATIVE_Y(30+48+10));
        make.left.mas_equalTo(RELATIVE_X(30));
        make.height.mas_equalTo(RELATIVE_HEIGHT(48));
    }];
}
/*
-(void)prepareForInterfaceBuilder{
    [self setupView];
   }
 */
@end
