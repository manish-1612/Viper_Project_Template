//
//  RootWireframe.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit


class RootWireframe {
    
    
    /// Function to initalize a view controller as Root view controller
    ///
    /// - Parameters:
    ///   - viewController: UIViewController as rootViewController
    ///   - inWindow: UIWindow as app current window
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = getNavigationController()
        navigationController.viewControllers = [viewController]
        inWindow.rootViewController = navigationController
        inWindow.makeKeyAndVisible()
    }
    
    
    
    /// Function to create a UINavigationController
    ///
    /// - Returns: UINavigationController as the navigationController
    private func getNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
}
