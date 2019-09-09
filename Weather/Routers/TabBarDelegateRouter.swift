//
//  AppDelegateRouter.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

public class TabBarDelegateRouter: NSObject, Router {
    // MARK: - Instance Properties
    public let window: UIWindow
    private let tabBarController = UITabBarController()
    
    // MARK: - Object Lifecycle
    public init(window: UIWindow) {
        self.window = window
        super.init()
        
        tabBarController.delegate = self
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    // MARK: - Router
    public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?) {
        if tabBarController.viewControllers == nil {
            tabBarController.viewControllers = [viewController]
        } else {
            tabBarController.viewControllers?.append(viewController)
        }
    }
    
    public func dismiss(animated: Bool) {
        // don't do anything
    }
}

extension TabBarDelegateRouter: UITabBarControllerDelegate {
    
}
