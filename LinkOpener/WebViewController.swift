//
//  WebVKitiewController.swift
//  LinkOpener
//
//  Created by Danik Lubohinec on 08.05.2020.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit
import WebKit

class WebVKitiewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.mvideo.ru/eyezon-b2c?buttonId=5ea1a746362fec2e2a11b1e5")!
        let urlRequest = URLRequest(url: url)
        
        webView.navigationDelegate = self
        webView.load(urlRequest)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated  {
            if let url = navigationAction.request.url,
                let host = url.host, !host.hasPrefix("www.mvideo.ru"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                print(url)
                print("Redirected to browser. No need to open it locally")
                decisionHandler(.cancel)
            } else {
                print("Open it locally")
                decisionHandler(.allow)
            }
        } else {
            print("not a user click")
            decisionHandler(.allow)
        }
    }
}
