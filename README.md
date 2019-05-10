# 3D Touch Demo
这是一个有关如何在你的应用里面使用3D Touch的教程。我在里面涉及到了‘3D Touch’和‘Peek and Pop’两种用户交互体验方式。
![](https://github.com/HuangRunHua/3DTouchDemo/blob/master/3DTouchDemo/demoPicture.jpg)
## 具体内容
- 主屏幕交互(Home Screen Interaction)
- 表格视图里面图片的预览和快捷分享功能
- 表格视图本身的预览和相关的操作

## 系统要求
这是我按照我自己的系统配置来定的
- Xcode 10及以上
- iOS 12.3及以上
- Swift 5.0及以上

## 3D Touch介绍
3D 触摸为基于触摸的交互添加了额外的维度。在受支持的设备上, 人们可以通过对触摸屏施加不同级别的压力来访问其他功能。应用可以通过显示菜单、显示其他内容或播放动画来做出响应。人们不需要学习新的手势来与3D 触摸互动。当他们轻轻按屏幕并得到响应时, 他们会快速发现额外的交互式维度。

## 主屏幕交互
在主屏幕上, 按下支持3D 触摸的应用图标将显示操作视图。通过此视图, 您可以快速执行常见的特定于应用程序的任务, 并查看有趣的信息。
一般的实现方法是在AppDelegate.swift文件里面进行初始化。
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /* 添加3D Touch的功能, 在这里先添加了创建新事项的功能 */
        let composeIcon = UIApplicationShortcutIcon(type: .compose)
        let compose = UIApplicationShortcutItem(type: "3DTouch.compose", localizedTitle: "新建博客", localizedSubtitle: nil, icon: composeIcon, userInfo: nil)
        // 使用UIApplicationShortcutIcon(templateImageName: "")语句，你可以添加你自己的图标，在这里我们不用
        //let helpIcon = UIApplicationShortcutIcon(templateImageName: "help")
        //let help = UIApplicationShortcutItem(type: "3DTouch.help", localizedTitle: "帮助", localizedSubtitle: nil, icon: helpIcon, userInfo: nil)
        let alarmIcon = UIApplicationShortcutIcon(type: .alarm)
        let alarm = UIApplicationShortcutItem(type: "3DTouch.alarm", localizedTitle: "设定闹钟", localizedSubtitle: nil, icon: alarmIcon, userInfo: nil)
        
        let cloudIcon = UIApplicationShortcutIcon(type: .cloud)
        let cloud = UIApplicationShortcutItem(type: "3DTouch.cloud", localizedTitle: "查看云端", localizedSubtitle: nil, icon: cloudIcon, userInfo: nil)
        
        let contactIcon = UIApplicationShortcutIcon(type: .contact)
        let contact = UIApplicationShortcutItem(type: "3DTouch.contact", localizedTitle: "个人中心", localizedSubtitle: nil, icon: contactIcon, userInfo: nil)
        
        let shortCutItems = [compose,alarm,cloud,contact]
        application.shortcutItems = shortCutItems
        return true
    }
```
以上是初始化了主屏幕的快捷按钮，还需要给对应的按钮添加运行的功能，同样可以在AppDelegate.swift里面进行
```swift
func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "3DTouch.compose" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.alarm" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.cloud" {
            // 做你觉得对的事
        }
        if shortcutItem.type == "3DTouch.contact" {
            // 做你觉得对的事
        }
    }
```
这样你就完成了主屏幕的触摸互动。

## Peek and pop
通过peek, 人们可以使用 3D Touch 在当前上下文上方临时显示的视图中预览项目 (如页面、链接或文件)。要查看支持此功能的项目, 请使用手指对项目施加一点压力。只需抬起手指即可退出偷看。要打开该项目并查看更多详细信息, 请更用力地按下, 直到项目弹出并填充屏幕。在某些peek视图中, 您可以向上滑动以显示相关的操作按钮。
要想使用这个功能，就需要在你对应的视图里面添加代理**UIViewControllerPreviewingDelegate**，并注册Peek & Pop功能，我将注册的语句写在tableView(,cellForRowAt indexPath,)里面。当然你需要判断设备是否可以使用这个功能，并且不要让偷看成为执行项目操作的唯一方法.并非每个设备都支持偷看和弹出, 有些人可能会关闭3D 触摸。你的应用应提供在类似情况下触发项目操作的其他方法。例如, 你的应用可以在触摸和按住项目时出现的视图中镜像偷看的快速操作。
```swift
 //这里是添加判断是否支持3D Touch的代码
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == .available {
                //支持3D Touch
                //注册Peek & Pop功能
                registerForPreviewing(with: self, sourceView: cell)
            }
        }
```
回到触发peek的界面，添加相应的代理
```swift
 /**
      isImagePeekAndPop这个变量用来判断是需要peek图片还是pop，当为true的时候peek图片
      它的值将会决定previewingContext(_ previewingContext:, commit viewControllerToCommit)里面使用show()还是present()
    */
    var isImagePeekAndPop = true
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        guard let cell = previewingContext.sourceView as? TableViewCell else {
            return nil
        }
        guard let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        /**
          在这里判断点击了图片的区域还是图片以外的区域，通过计算触摸点的位置(x,y)来判断
          如果 (触摸点所在的x值<=图片起始x值) && (触摸点所在的x值>=图片末尾x值) && (触摸点所在的y值<=图片起始y值) && (触摸点所在的y值>=图片末尾y值)
          那么触摸点就在图片上，此时要peek的是图片而不是cell
        */
        if location.x >= cell.firstImage.frame.origin.x && location.y >= cell.firstImage.frame.origin.y && location.y <= cell.firstImage.frame.origin.y + cell.firstImage.frame.height && location.x <= cell.firstImage.frame.origin.x + cell.firstImage.frame.width {
            guard let showImageDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailImageStoryboard") as? detailImageViewController else {
                return nil
            }
            isImagePeekAndPop = true
            showImageDetailViewController.image = blogs[indexPath.row].image
            showImageDetailViewController.preferredContentSize = CGSize(width: 0.0, height: 360.0)
            previewingContext.sourceRect = cell.firstImage.imageView!.frame
            return showImageDetailViewController
        } else {
            guard let showCellDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ShowDetailCellStoryboard") as? detailCellTableViewController else {
                return nil
            }
            isImagePeekAndPop = false
            showCellDetailViewController.blog = blogs[indexPath.row]
            showCellDetailViewController.preferredContentSize = CGSize(width: 0.0, height: 420.0)
            previewingContext.sourceRect = cell.frame
            
            return showCellDetailViewController
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if isImagePeekAndPop {
            self.present(viewControllerToCommit, animated: true, completion: nil)
        } else {
            show(viewControllerToCommit, sender: self)
        }
    }
```

## 给你的预览添加操作按钮
并不是每个peek都需要动作按钮, 但它们是为常见任务提供快捷方式的好方法。如果你的应用已经为项目提供了自定义的触摸和保留操作, 则在偷看过程中包含相同的操作是一种很好的做法。
在你预览所对应的视图里面重写 *previewActionItems: [UIPreviewActionItem]* 元素，例如这是预览照片所对应的分享操作
```swift
/**
     @previewActionItems: [UIPreviewActionItem]
     当用户在3D Touch预览上向上滑动时显示的快速操作
     */
    override var previewActionItems: [UIPreviewActionItem] {
        let sharePreviewAction = UIPreviewAction(title: "Share...", style: .default, handler: {(_, _) in
            guard let image = self.image else { return }
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            UIApplication.shared.keyWindow?.rootViewController?.present(activityController, animated: true, completion: nil)
        })
        return [sharePreviewAction]
    }
```
还有，这是预览详细内容下面的动作按钮
```swift
/**
     @previewActionItems: [UIPreviewActionItem]
     当用户在3D Touch预览上向上滑动时显示的快速操作
     */
    override var previewActionItems: [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "测试1", style: .default) { (_, _) in
            // 在这里做你觉得对的事
        }
        let action2 = UIPreviewAction(title: "测试2", style: .default) { (_, _) in
            // 在这里做你觉得对的事
        }
        
        let action3 = UIPreviewAction(title: "取消", style: .destructive) { (_, _) in
            // 在这里做你觉得对的事
        }
        
        ////该按钮可以是一个组，点击该组时，跳到组里面的按钮。
        let subAction1 = UIPreviewAction(title: "1", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let subAction2 = UIPreviewAction(title: "2", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let subAction3 = UIPreviewAction(title: "3", style: .selected) { (_, _) in
            // 在这里做你觉得对的事
        }
        let groupAction = UIPreviewActionGroup(title: "更多", style: .default, actions: [subAction1, subAction2, subAction3])
        
        return [action1,action2, groupAction, action3]
    }
```



















