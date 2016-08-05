# LXTextViewLink

使用UITextView实现超链接，与自定义表情皮配，还能加载自定义大小的本地图片与网络图片。

用的是系统UITextView控件的linkTextAttributes和attributedText属性实现了此功能，相关API须在>=7.0的系统上运行。由于实现了在文本里加载网络图片，所以导入了SDWebImage第三方文件，若不需要可以删除LXTextView.h文件里的相关代码（#import "UIImageView+WebCache.h"以及- (void)downloadImageWithUrl:(NSString *)urlString withIndex:(NSInteger)index
）。 

#####效果图如下：<br>
![image](https://github.com/SoftProgramLX/LXTextViewLink/blob/master/TextViewLink/screen.png)

===========================

###`注意：`
* 效果图上匹配了一些错误的网址，那没关系，正则表达式不够严谨，这也可以满足一般需求了。
* 链接需要深按才有效，系统的原因。

<br>
使用方法非常简单，集成代码如下：<br>
```objective-c
    LXTextView *textView = [[LXTextView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth - 20, kScreenHeight - 20)];
    textView.delegate = self;
    textView.editable = NO; // 非编辑状态下才可以点击Url]
    textView.fontFloat = 18.;
    textView.textString = @"Thiswww.hiphotos.baidu.comis ancel超链接ofa bri_StringWith Attachment:textAttachment]indfdxcsehttps://www.baidu.comrtAttribu tedStriUse [傲慢]this method to release shared invali dateexwwwwssdvdv.hiphotos.baidu.dsccomamptimers, and [吓]isa覆盖核 http://c.hip[大哭]hotos.baidu.com设施nexstore enough application state information[微笑] to re https://c.hiphotos.baidu.cnstore your";
    [self.view addSubview:textView];
```

核心代码如下：<br>
```
- (void)setTextString:(NSString *)string
{
    NSDictionary *attributeDict =
        [NSDictionary dictionaryWithObjectsAndKeys:
         [UIFont systemFontOfSize:self.fontFloat], NSFontAttributeName,
         [UIColor blackColor], NSForegroundColorAttributeName,nil];
    
    attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributeDict];
    
    //设置行距与换行模式
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5.0;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    
    NSArray *emojiArr = [LXHelpClass validateEmojiOfText:attributedString.string];
    for (int i = 0; i < emojiArr.count; i++) {
        NSInteger index = [helpClass.keyArr indexOfObject:emojiArr[i]];
        NSString *imgName = [helpClass.valueArr objectAtIndex:index];
        NSRange range = [attributedString.string rangeOfString:emojiArr[i] options:NSCaseInsensitiveSearch range:NSMakeRange(0, attributedString.string.length)];
        
        //正则表达式匹配的表情
        LXTextAttachment *textAttachmentEmoji = [[LXTextAttachment alloc] initWithData:nil ofType:nil];
        textAttachmentEmoji.imgSize = CGSizeMake(30 ,30);
        textAttachmentEmoji.image = [UIImage imageNamed:imgName] ;
        NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachmentEmoji];
        [attributedString replaceCharactersInRange:range withAttributedString:textAttachmentString];
    }
    
    //自定义添加的本地图片
    LXTextAttachment *textAttachmentImg = [[LXTextAttachment alloc] initWithData:nil ofType:nil];
    textAttachmentImg.imgSize = CGSizeMake(270, 160);
    textAttachmentImg.image = [UIImage imageNamed:@"bird"];
    NSAttributedString *textAttachmentString2 = [NSAttributedString attributedStringWithAttachment:textAttachmentImg];
    [attributedString insertAttributedString:textAttachmentString2 atIndex:56];
    
    NSArray *linkArr = [LXHelpClass validateLinkOfText:attributedString.string];
    for (int i = 0; i < linkArr.count; i++) {
        NSRange range = NSRangeFromString(linkArr[i]);
        //正则表达式匹配的链接
        NSString *linkStr = [attributedString.string substringWithRange:range];
        [attributedString addAttribute:NSLinkAttributeName value:linkStr range:range];
    }
    
    //自定义的链接
    [attributedString addAttribute:NSLinkAttributeName value:@"http://baidu.com" range:[[attributedString string] rangeOfString:@"超链接"]];
    
    NSDictionary *linkAttributes =
    @{NSForegroundColorAttributeName:[UIColor greenColor], NSUnderlineColorAttributeName:[UIColor lightGrayColor], NSUnderlineStyleAttributeName:@(NSUnderlinePatternSolid)};
    
    self.linkTextAttributes = linkAttributes;
    self.attributedText = attributedString;
}
```
   
<br>
###`QQ:2239344645`    [我的github](https://github.com/SoftProgramLX?tab=repositories)
<br>
