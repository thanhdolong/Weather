//
//  HomeCoordinator.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    public var children: [Coordinator] = []
    public let router: Router
    
    // MARK: - Object Lifecycle
    public init(router: Router) {
        self.router = router
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = ForecastViewController()
        viewController.tabBarItem = UITabBarItem(title: "Today", image: nil, selectedImage: nil)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}
