//
//  ViewController.swift
//  QuitSmoking
//
//  Created by 이경민 on 2022/03/13.
//

import UIKit

class ViewController: UITabBarController {
    
    var tabOne = HomeViewController()
    
    var tabTwo:UIViewController{
        let tabTwoBar = UITabBarItem(title: "기록", image: UIImage(systemName: "calendar"), tag: 2)
        let controller = UIViewController()
        controller.tabBarItem = tabTwoBar
        return controller
    }
    
    var tabThree:UIViewController{
        let tabThreeBar = UITabBarItem(title: "탐색", image: UIImage(systemName: "safari"), tag: 3)
        let controller = UIViewController()
        controller.tabBarItem = tabThreeBar
        return controller
    }
    var tabFour:UIViewController{
        let tabFourBar = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape"), tag: 4)
        let controller = UIViewController()
        controller.tabBarItem = tabFourBar
        return controller
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        tabOne.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 1)
        
        self.viewControllers = [tabOne,tabTwo,tabThree,tabFour]
        

    }
}

