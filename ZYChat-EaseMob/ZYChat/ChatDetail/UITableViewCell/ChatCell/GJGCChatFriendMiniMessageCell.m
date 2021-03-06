//
//  GJGCChatFriendMiniMessageCell.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 14-12-8.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "GJGCChatFriendMiniMessageCell.h"

@interface GJGCChatFriendMiniMessageCell ()

@property (nonatomic,strong)GJCFCoreTextContentView *timeLabel;

@property (nonatomic,strong)GJCFCoreTextContentView *contentLabel;

@property (nonatomic,strong)UIImageView *backImageView;

@property (nonatomic,assign)CGFloat contentBordMargin;

@property (nonatomic,assign)CGFloat cellMargin;

@end

@implementation GJGCChatFriendMiniMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.cellMargin = 15.f;
        self.contentBordMargin = 13.f;
        self.backgroundColor = [UIColor clearColor];

        self.backImageView = [[UIImageView alloc]init];
        self.backImageView.frame = self.bounds;
        self.backImageView.layer.cornerRadius = 4.f;
        self.backImageView.layer.masksToBounds = YES;
        self.backImageView.backgroundColor = GJCFQuickHexColor(@"e0e0e0");
        [self.contentView addSubview:self.backImageView];
        
        self.contentLabel = [[GJCFCoreTextContentView alloc]init];
        self.contentLabel.gjcf_width = GJCFSystemScreenWidth - 2*self.contentBordMargin;
        self.contentLabel.gjcf_height = 23;
        self.contentLabel.gjcf_top = self.timeLabel.gjcf_bottom + self.contentBordMargin;
        self.contentLabel.contentBaseWidth = self.contentLabel.gjcf_width;
        self.contentLabel.contentBaseHeight = self.contentLabel.gjcf_height;
        [self.backImageView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)setContentModel:(GJGCChatContentBaseModel *)contentModel
{
    if (!contentModel) {
        return;
    }
    
    GJGCChatFriendContentModel *chatContentModel = (GJGCChatFriendContentModel *)contentModel;
    
    self.backImageView.gjcf_top = 5;
    self.contentLabel.contentAttributedString = chatContentModel.simpleTextMessage;
    CGSize contentSize = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:chatContentModel.simpleTextMessage forBaseContentSize:self.contentLabel.contentBaseSize];
    self.contentLabel.gjcf_size = contentSize;
    self.backImageView.gjcf_size = CGSizeMake(contentSize.width + 2*8, contentSize.height + 8);
    self.backImageView.gjcf_centerX = GJCFSystemScreenWidth/2;
    self.contentLabel.gjcf_centerX = self.backImageView.gjcf_width/2;
    self.contentLabel.gjcf_centerY = self.backImageView.gjcf_height/2;
    
}

- (CGFloat)heightForContentModel:(GJGCChatContentBaseModel *)contentModel
{
    if (!contentModel) {
        return 0.f;
    }
    
    return self.backImageView.gjcf_bottom + 8;
}

@end
