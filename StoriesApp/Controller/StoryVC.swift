//
//  StoryVC.swift
//  StoriesApp
//
//  Created by Neria Jerafi on 7.6.2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit
import WebKit
class StoryVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var story:Story?
    override func viewDidLoad() {
        super.viewDidLoad()
        VCInit()
}

    func VCInit()  {
        self.webView.navigationDelegate = self
        self.nextButton.isEnabled = false
        self.backButton.isEnabled = false
        guard let urlString = self.story?.url else { return  }
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    @IBAction func backAction(_ sender: Any) {
        self.webView.goBack()
    }
    @IBAction func nextAction(_ sender: Any) {
        self.webView.goForward()
    }
    
}
extension StoryVC:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("load")
        webView.canGoBack ?
            (self.backButton.isEnabled = true) : (self.backButton.isEnabled = false)
        
        webView.canGoForward ? (self.nextButton.isEnabled = true) : (self.nextButton.isEnabled = false)
    }
}
