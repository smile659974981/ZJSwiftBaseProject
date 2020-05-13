//
//  ZJBaseTabBarController.swift
//  ZJSwiftBaseProject
//
//  Created by silence on 2020/5/12.
//  Copyright © 2020 silence. All rights reserved.
//

//import UIKit

import RAMAnimatedTabBarController
import Hue

class ZJBaseTabBarController: RAMAnimatedTabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        commitInitView()
        addAllChildControllers()
        super.viewDidLoad()
        self.delegate = self
    }

    func addAllChildControllers() {
        //首页
        addChildVC(childVC: HomeViewController(), title: "首页", normalImg: UIImage(named: "icon_sy"), selectedImg: UIImage(named: "icon_sy_click"))
        //病程记录
        addChildVC(childVC: CourseRecordViewController(), title: "病程记录", normalImg: UIImage(named: "icon_record"), selectedImg: UIImage(named: "icon_record_click"))
        //我的
        addChildVC(childVC: MineViewController(), title: "我的", normalImg: UIImage(named: "icon_mine"), selectedImg: UIImage(named: "icon_mine_click"))
    }
    
    func addChildVC(childVC: ZJBaseViewController, title: String?, normalImg: UIImage?, selectedImg: UIImage?){
        let nav = ZJBaseNavigationController(rootViewController: childVC)
        let item = RAMAnimatedTabBarItem(title: title, image: normalImg?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImg?.withRenderingMode(.alwaysOriginal))
        // MARK: - 选择这其中的一个RAMFumeAnimation, RAMBounceAnimation, RAMRotationAnimation, RAMFrameItemAnimation, RAMTransitionAnimation
        // MARK: - 可以为每一个item加载不同的动画，根据需求添加
        let animation = ZJTabbarAnimation()
        item.animation = animation
        // MARK: - 先把导航控制器加入tabbar控制器上，再添加item，顺序错了没有动画效果。
        addChild(nav)
        nav.tabBarItem = item
    }
}

extension ZJBaseTabBarController{
    func commitInitView() {
        view.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(hex: "#06BA8E")
        tabBar.barTintColor = .white
        tabBar.barStyle = .default
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.cornerRadius = 10
        tabBar.layer.borderColor = UIColor(hex: "#06BA8E").cgColor
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBarController?.tabBar.isTranslucent = false
    }
}


class ZJTabbarAnimation: RAMItemAnimation {
    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = UIColor(hex: "#06BA8E")
        switch icon.superview?.tag {
        case 0:
            icon.image = UIImage.init(named: "icon_sy_click")
            break
        case 1:
            icon.image = UIImage.init(named: "icon_record_click")
            break
        default:
            icon.image = UIImage.init(named: "icon_mine_click")
        }
    }
    
    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = UIColor(hex: "#939393")
        switch icon.superview?.tag {
          case 0:
              icon.image = UIImage.init(named: "icon_sy")
              break
          case 1:
              icon.image = UIImage.init(named: "icon_record")
              break
          default:
              icon.image = UIImage.init(named: "icon_mine")
          }
    }
    
    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = UIColor(hex: "#06BA8E")
    }
     
     func playBounceAnimation(_ icon: UIImageView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.75)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
     }
}
