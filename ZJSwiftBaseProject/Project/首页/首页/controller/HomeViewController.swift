//
//  HomeViewController.swift
//  ZJSwiftBaseProject
//
//  Created by silence on 2020/5/13.
//  Copyright © 2020 silence. All rights reserved.
//

import UIKit

class HomeViewController: ZJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    private func prepareUI() {
        navBarBackgroundAlpha = 0.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let vc = MineViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
