//
//  WebVKitiewController.swift
//  LinkOpener
//
//  Created by Danik Lubohinec on 08.05.2020.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class WebVKitiewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.mvideo.ru/eyezon-b2c?buttonId=5ea1a746362fec2e2a11b1e5")!
        let urlRequest = URLRequest(url: url)
        
        webView.navigationDelegate = self
        webView.load(urlRequest)
    }
    
    // Open link with WebKit
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                let host = url.host, !host.hasPrefix(""),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        } else {
            decisionHandler(.allow)
        }
    }
}
