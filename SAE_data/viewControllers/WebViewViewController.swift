//
//  WebViewViewController.swift
//  SAE_data
//
//  Created by Neo Chou on 2020/4/8.
//  Copyright © 2020 Neo Chou. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    let webView = WKWebView()
    var urlString : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpWebView()
        self.loadUrl(url: urlString ?? "")
    }
    

    func setUpWebView() {
        
            webView.uiDelegate = self
            webView.navigationDelegate = self
            webView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            webView.allowsBackForwardNavigationGestures = true
            self.view.addSubview(webView)
        
  }
    
    func loadUrl(url:String) {
        let url = URL(string: url)
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}

extension WebViewViewController: WKUIDelegate, WKNavigationDelegate {
    
}
