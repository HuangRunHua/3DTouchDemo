//
//  Blog.swift
//  3DTouchDemo
//
//  Created by Joker Hook on 2019/5/10.
//  Copyright © 2019 Joker Hook. All rights reserved.
//

import Foundation
import UIKit

/**
  Blog类包含三个成员变量title、detail、image
  为了方便起见，认为image不为空
 */

struct Blog {
    var title: String
    var detail: String
    var image: UIImage
}

// 创造我们的数据
var blogs: [Blog] = [
    Blog(title: "WWDC19 Registration Ends Today", detail: "Registration closes on Wednesday, March 20 at 5:00 p.m. PDT. Don’t miss your chance to register for this year’s Apple Worldwide Developers Conference in San Jose, June 3-7", image: UIImage(named: "1")!),
    Blog(title: "Peek and Pop", detail: "A peek lets people use 3D Touch to preview an item, such as a page, link, or file, in a view that appears temporarily above the current context. To peek at an item that supports this functionality, apply a little pressure to the item with your finger. Simply lift your finger to exit the peek. To open the item and see more detail, press a little harder until the item pops and fills the screen. In some peek views, you can swipe up to reveal related action buttons. For example, while peeking at a link in Safari, you can swipe up to reveal buttons for opening the link in the background, adding the link to your reading list, and copying the link.", image: UIImage(named: "2")!),
    Blog(title: "Apply for a WWDC19 Scholarship", detail: "WWDC Scholarships reward talented students and STEM organization members with the opportunity to attend this year’s conference. Apply by Sunday, March 24, 2019 at 5:00 p.m. PDT.", image: UIImage(named: "3")!),
    Blog(title: "New Design Resources Now Available", detail: "Make sure your iOS and watchOS apps continue to deliver outstanding user experiences. Take advantage of new Siri Shortcuts design templates, the SF Compact Rounded font for watchOS, and the watchOS design kit for Adobe XD. You can also get updated design templates for iOS Home Screen, Notifications, Widgets, and Home Screen Quick Actions.", image: UIImage(named: "4")!),
    Blog(title: "Home Screen Interaction", detail: "On the Home screen, pressing the icon of an app that supports 3D Touch displays an action view. This view lets you quickly perform common app-specific tasks and see interesting information. Calendar, for example, provides a shortcut for creating an event. It also shows the next event on your schedule. For design guidance, see Home Screen Actions and Widgets.", image: UIImage(named: "5")!),
    Blog(title: "New Notarization Requirements", detail: "We're working with developers to create a safer Mac user experience through a process where all software, whether distributed on the App Store or outside of it, is signed or notarized by Apple. With the public release of macOS 10.14.5, we require that all developers creating a Developer ID certificate for the first time notarize their apps, and that all new and updated kernel extensions be notarized as well. This will help give users more confidence that the software they download and run, no matter where they get it from, is not malware by showing a more streamlined Gatekeeper interface.", image: UIImage(named: "6")!),
    Blog(title: "Apple Pay Has Expanded to Germany", detail: "You can now support Apple Pay for your customers in Germany, providing an easy and secure way for them to pay within your apps and websites.", image: UIImage(named: "7")!),
    Blog(title: "App Store Best of 2018", detail: "Congratulations to the developers featured in the App Store Best of 2018. This showcase honors our favorite apps and games on the App Store, and celebrates the amazing experiences that developers have created for Apple platforms.", image: UIImage(named: "8")!),
    Blog(title: "App Store Connect Holiday Schedule", detail: "The busiest season on the App Store is almost here. Make sure your apps are up to date and ready for the holidays. New apps and app updates will not be accepted December 23 to 27 (Pacific Time), so any releases should be submitted, approved, and scheduled in advance. Other App Store Connect and developer account features will remain available.", image: UIImage(named: "9")!),
    Blog(title: "Get Ready for the New iPad Pro", detail: "Make sure your apps and games take advantage of the new iPad Pro to deliver faster, more responsive experiences like never before. The new all-screen design goes from edge to edge. Face ID works seamlessly in portrait or landscape. The new A12X Bionic chip outperforms the vast majority of portable PCs, runs pro apps, and enables stunning augmented reality experiences. And with support for accessories like the second-generation Apple Pencil and Smart Keyboard Folio, iPad Pro represents the biggest change to iPad ever.", image: UIImage(named: "10")!)
]
