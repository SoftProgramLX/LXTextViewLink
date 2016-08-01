# LXTextViewLink
Using UITextView to achieve hyperlinks, with a custom expression, but also to load the custom size of the local image and network. Easy to get started.（使用UITextView实现超链接，与自定义表情皮配，还能加载自定义大小的本地图片与网络图片。容易上手。）

用的是系统UITextView控件的linkTextAttributes和attributedText属性实现了此功能，相关API须在>=7.0的系统上运行。由于实现了在文本里加载网络图片，所以导入了SDWebImage第三方文件，若不需要可以删除LXTextView.h文件里的相关代码（#import "UIImageView+WebCache.h"以及- (void)downloadImageWithUrl:(NSString *)urlString withIndex:(NSInteger)index
）。 

效果如下图：<br>
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
    <br>QQ：2239344645
