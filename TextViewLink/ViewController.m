//
//  ViewController.m
//  TextViewLink
//
//  Created by 李旭 on 16/4/19.
//  Copyright © 2016年 李旭. All rights reserved.
//

#import "ViewController.h"
#import "LXTextView.h"
#import "LXHelpClass.h"

// 屏幕宽与高
#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController () <UITextViewDelegate>

@property (nonatomic, weak) LXTextView *textView;

@end 

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXTextView *textView = [[LXTextView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, kScreenHeight - 20)];
    textView.delegate = self;
    textView.editable = NO; // 非编辑状态下才可以点击Url]
    textView.fontFloat = 18.;
    textView.textString = @"Thiswww.hiphotos.baidu.comis ancel超链接ofa bri_StringWith Attachment:textAttachment]indfdxcsehttps://www.baidu.comrtAttribu tedStriUse [傲慢]this method to release shared invali dateexwwwwssdvdv.hiphotos.baidu.dsccomamptimers, and [吓]isa覆盖核 http://c.hip[大哭]hotos.baidu.com设施nexstore enough application state information[微笑] to re https://c.hiphotos.baidu.cnstore your";
    [self.view addSubview:textView];
    self.textView = textView;
    
    //下载一张图片放到第88位字符的位置
    [self.textView downloadImageWithUrl:@"http://c.hiphotos.baidu.com/image/pic/item/64380cd7912397dd5393db755a82b2b7d1a287dd.jpg" withIndex:88];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    NSLog(@"URL:%@   scheme:%@   host:%@", URL, [URL scheme], [URL host]);
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




