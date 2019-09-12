//
//  UIViewController.swift
//  Weather
//
//  Created by Thành Đỗ Long on 11/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

// MARK: Alert Extensions
extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Display indicator Extensions
extension UIViewController {
    func displayIndicator(onView: UIView, offset: CGFloat = 0) -> UIView {
        
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        
        let activityIndicator = UIActivityIndicatorView.init(style: .gray)
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: view.center.x, y: view.center.y + offset)
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeIndicator(indicator: UIView) {
        DispatchQueue.main.async {
            indicator.removeFromSuperview()
        }
    }
}
