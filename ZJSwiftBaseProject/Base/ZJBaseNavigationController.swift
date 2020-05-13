//
//  ZJBaseNavigationController.swift
//  ZJSwiftBaseProject
//
//  Created by silence on 2020/5/13.
//  Copyright © 2020 silence. All rights reserved.
//

import UIKit

class ZJBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dict:NSDictionary = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        self.navigationBar.titleTextAttributes = dict as? [NSAttributedString.Key : Any]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            let backItem = UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(backItemClick(sender:)))
            viewController.navigationItem.leftBarButtonItem = backItem;
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // MARK: - action
    @objc fileprivate func backItemClick(sender: UIBarButtonItem) {
        super.popViewController(animated: true)
    }
}
