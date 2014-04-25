# WKInputAccessoryView

iOS键盘辅助工具按钮

[点击查看效果视频](http://v.youku.com/v_show/id_XNzAzNDg1NzAw.html)

![WKInputAccessoryView](http://farm8.staticflickr.com/7309/12628599893_785fefcf94_o.png)

![替换按键](http://farm3.staticflickr.com/2882/12628558845_2d4e025c65_o.png)

UITextView 的 inputAcessoryView可以用来在键盘的上面添加一个辅助工具(UIView), WKInputAccessoryView 就是整个UIView，他可以

* 在键盘上添加几个按键，可以用来插入常用的标点符号;
* 长按住一个按钮可以弹出符号列表，可以替换整个按钮的内容;
* 中间是一个触摸区域，左右滑动可以控制光标左右一个一个字符移动，往下拖动可以让键盘隐藏;

## 使用
创建WKInputAccessoryView，然后设置UITextView的inputAccessoryView。

    CGRect frame=CGRectInset(self.view.bounds, 3.0f, 10.0f);
    _textView=[[UITextView alloc]initWithFrame:frame];
    _textView.font=[UIFont systemFontOfSize:32.0f];
    _textView.textColor=[UIColor darkGrayColor];
    _textView.text=@"WKInputAccessoryView";
    _textView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_textView];
    [_textView becomeFirstResponder];
    
    WKInputAccessoryView* inputAcccessoryView=[[[WKInputAccessoryView alloc]initWithTargetTextView:_textView] autorelease];
    inputAcccessoryView.parentViewControler=self; #为了要显示那个选择替换按钮的view controller时使用
    inputAcccessoryView.delegate=self;
    _textView.inputAccessoryView=inputAcccessoryView;

实现WKInputAccessoryViewDelegate，来获取修改完成时的通知（往下滑动键盘关闭时触发）

	#pragma mark - WKInputAccessoryViewDelegate
	///点击保存按钮时
	-(void)saveOnTargetTextView:(UITextView *)textView{
    NSLog(@"save:%@",textView.text);
	}
	///点击取消按钮时
	-(void)cancelOnTargetTextView:(UITextView *)textView{
	    NSLog(@"cancel:%@",textView.text);
	}
	///下拉键盘完成编辑并保存
	-(void)saveAndCompleteOnTargetTextView:(UITextView *)textView{
	    NSLog(@"saveAndComplete:%@",textView.text);
	}

为了支持在旋转，需要刷新按键

	-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
	    WKInputAccessoryView *inputAccessoryView=(WKInputAccessoryView*)_textView.inputAccessoryView;
	    [inputAccessoryView rebuildButtons];
	}


## TODO
* ~~还不支持横向屏幕~~;
* 按钮需要做好看点;
* ~~简化结构~~;
