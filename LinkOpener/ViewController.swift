//
//  MainViewController.swift
//  LinkOpener
//
//  Created by Danik Lubohinec on 08.05.2020.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit
import SafariServices

class MainViewController: UIViewController {
    
    @IBAction func openSafariServices(_ sender: Any) {
        openLink("https://www.mvideo.ru/eyezon-b2c?buttonId=5ea1a746362fec2e2a11b1e5")
    }
    
    @IBAction func opneSafariApp(_ sender: Any) {
        loadURLString("https://www.mvideo.ru/eyezon-b2c?buttonId=5ea1a746362fec2e2a11b1e5")
    }
    
    @IBAction func openWebKit(_ sender: Any) {
        self.present(WebVKitiewController(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Open link in Safari extension
    func openLink(_ link: String) {
        guard let url = URL(string: link) else { return }
        let svc = SFSafariViewController(url: url)
        svc.preferredControlTintColor = .systemPink
        self.present(svc, animated: true, completion: nil)
    }
    
    // Open in Safari App
    func loadURLString(_ link: String) {
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}

