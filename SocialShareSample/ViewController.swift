//
//  ViewController.swift
//  SocialShareSample
//
//  Created by akatsuki174 on 2016/04/24.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import UIKit
import FBSDKShareKit

class ViewController: UIViewController {
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.frame = CGRectMake(0,0,180,50)
        button.backgroundColor = UIColor.blueColor()
        button.layer.masksToBounds = true
        button.setTitle("Share!", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.layer.cornerRadius = 15.0
        let frame = self.view.frame
        button.layer.position = CGPoint(x: frame.width / 2, y:frame.height / 2)
        button.addTarget(self, action: #selector(ViewController.tappedButton(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tappedButton(sender: UIButton) {
        let url:NSURL = NSURL(string:"https://www.google.co.jp")!
        let dialog = FBSDKShareDialog()
        dialog.shareContent = self.getShareLinkContent(url)
        dialog.mode = FBSDKShareDialogMode.Native
        if dialog.canShow() {
            FBSDKShareDialog.showFromViewController(self, withContent: self.getShareLinkContent(url), delegate: nil)
        }
    }
    
    private func getShareLinkContent(objectURL: NSURL) -> FBSDKSharingContent {
        let content = FBSDKShareLinkContent()
        content.contentURL = objectURL
        return content
    }
}

