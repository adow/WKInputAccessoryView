# WKInputAccessoryView

iOS键盘辅助工具按钮

现在只是一个最简单的版本，只够能正常运行，只是临时随便写写的所以其中的代码还需要重构。

![WKInputAccessoryView](http://farm8.staticflickr.com/7309/12628599893_785fefcf94_o.png)

![替换按键](http://farm3.staticflickr.com/2882/12628558845_2d4e025c65_o.png)

UITextView 的 inputAcessoryView可以用来在键盘的上面添加一个辅助工具(UIView), WKInputAccessoryView 就是整个UIView，他可以

* 在键盘上添加几个按键，可以用来插入常用的标点符号;
* 长按住一个按钮可以弹出符号列表，可以替换整个按钮的内容;
* 中间是一个触摸区域，左右滑动可以控制光标左右一个一个字符移动，往下拖动可以让键盘隐藏;

## 使用
创建WKInputAccessoryView，然后设置UITextView的inputAccessoryView。

	WKInputAccessoryView* inputAcccessoryView=[[[WKInputAccessoryView alloc]initWithTargetTextView:textView] autorelease];
    inputAcccessoryView.parentViewControler=self;
    inputAcccessoryView.delegate=self;
    textView.inputAccessoryView=inputAcccessoryView;

实现WKInputAccessoryViewDelegate，来获取修改完成时的通知（往下滑动键盘关闭时触发）

	#pragma mark - WKInputAccessoryViewDelegate
	-(void)targetTextViewDidCompleteEdit{
	    NSLog(@"targetTextViewDidCompleteEdit");
	}


## TODO
* 还不支持横向屏幕;
* 按钮需要做好看点;
* 简化结构;
