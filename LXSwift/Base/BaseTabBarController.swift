//
//  BaseTabBarController.swift
//  LXSwift
//
//  Created by 李祥 on 2024/4/26.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemTitleTextAttributes()
        setChildViewControllers()
        
    }
    
    func  setupItemTitleTextAttributes(){
        
        let normaoColor = BaseTabBarNormalTextColor
        
        let selectColor = BaseTabBarSelectTextColor
        
        Jh_setTabBarColor(normaoColor, selectColor, nil)
        
    }
    
    func setChildViewControllers(){
        setOneChildViewCOntroller(childVC: WeiXinViewController(), title: "微信", image: "tab1", selectimage: "tab1_select")
        setOneChildViewCOntroller(childVC: ContactViewController(), title: "通讯录", image: "tab2", selectimage: "tab2_select")
        setOneChildViewCOntroller(childVC: FindViewController(), title: "发现", image: "tab3", selectimage: "tab3_select")
        setOneChildViewCOntroller(childVC: MineViewController(), title: "我", image: "tab4", selectimage: "tab4_select")
        
    }
    
    fileprivate func setOneChildViewCOntroller(childVC:UIViewController,title:String,image:String, selectimage:String ){
        
        childVC.tabBarItem.title = title
        
        if (image.count>0) { // 图片名有具体值
            childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            // 声明：这张图片按照原始的样子显示出来，不要自动渲染成其他颜色（比如蓝色）
            childVC.tabBarItem.selectedImage = UIImage(named: selectimage)?.withRenderingMode(.alwaysOriginal)
        }
        let nav = BaseNavigationController.init(rootViewController: childVC)
        self.addChild(nav)
    }
        
        
    
    
    
}


// MARK: - 设置TabBar 文字颜色和背景色
func Jh_setTabBarColor(_ normalColor:UIColor,_ selectColor:UIColor,_ bgColor:UIColor?) {
    let tabBarItem = UITabBarItem.appearance()
    
    // 普通状态下的文字属性
    var normalAttrs = Dictionary<NSAttributedString.Key,Any>()
    normalAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10)
    normalAttrs[NSAttributedString.Key.foregroundColor] = normalColor
    // 选中状态下的文字属性
    var selectedAttrs = Dictionary<NSAttributedString.Key,Any>()
    selectedAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10)
    selectedAttrs[NSAttributedString.Key.foregroundColor] = selectColor
    
    tabBarItem.setTitleTextAttributes(normalAttrs, for: .normal)
    tabBarItem.setTitleTextAttributes(selectedAttrs, for: .selected)
    
    // iOS13适配，处理未选中颜色失效
    if #available(iOS 13.0, *) {
        UITabBar.appearance().unselectedItemTintColor = normalColor
    }
    // iOS15适配，处理tabBar背景和分割线透明，选中颜色失效
    if #available(iOS 15.0, *) {
        let appearance = UITabBarAppearance();
        if (bgColor != nil) {
            appearance.backgroundColor = bgColor; // tabBar背景颜色
        }
        //        appearance.backgroundEffect = nil; // 去掉半透明效果
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs;
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs;
        UITabBar.appearance().standardAppearance = appearance;
        UITabBar.appearance().scrollEdgeAppearance = appearance;
    }
}
