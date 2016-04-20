# LXTextViewLink
Using UITextView to achieve hyperlinks, with a custom expression, but also to load the custom size of the local image and network. Easy to get started.（使用UITextView实现超链接，与自定义表情皮配，还能加载自定义大小的本地图片与网络图片。容易上手。）


用的事系统UITextView控件的linkTextAttributes和attributedText属性实现了此功能，相关API须在>=7.0的系统上运行。由于实现了在文本里加载网络图片，所以导入了SDWebImage第三方文件，若不需要可以删除LXTextView.h文件里的相关代码（#import "UIImageView+WebCache.h"以及- (void)downloadImageWithUrl:(NSString *)urlString withIndex:(NSInteger)index
）。 
QQ：2239344645
