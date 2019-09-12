//
//  TodayCoordinator.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import Swinject

class ForecastCoordinator: Coordinator {
    public var container: Container
    public var children: [Coordinator] = []
    public let router: Router
    
    // MARK: - Object Lifecycle
    public init(router: Router, container: Container) {
        self.router = router
        self.container = container
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = container.resolve(ForecastViewController.self)!
        viewController.tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(named: "forecast"), selectedImage: UIImage(named: "forecast"))
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}
