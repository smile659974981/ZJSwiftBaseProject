//
//  ZJBaseViewController.swift
//  ZJSwiftBaseProject
//
//  Created by silence on 2020/5/12.
//  Copyright © 2020 silence. All rights reserved.
//

import UIKit

class ZJBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    private func config() {
        self.view.backgroundColor = .white
        navBarShadowImageHidden = true
        navBarBarTintColor = .white
        navBarTitleColor = UIColor(hex: "#06BA8E")
    }
}
