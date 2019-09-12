//
//  HomeCoordinator.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import Swinject

class TodayCoordinator: Coordinator {
    public var rootViewController: TodayViewController?
    public var container: Container
    public var children: [Coordinator] = []
    public let router: Router
    
    // MARK: - Object Lifecycle
    public init(router: Router, container: Container) {
        self.router = router
        self.container = container
    }
    
    func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = container.resolve(TodayViewController.self)!
        viewController.delegate = self
        viewController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(named: "today"), selectedImage: UIImage(named: "today"))
        rootViewController = viewController
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension TodayCoordinator: TodayViewControllerDelegate {
    func didShareButtonTapped(text description: String) {
        let activityViewController = UIActivityViewController(activityItems: [description] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = rootViewController?.view
        rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}
