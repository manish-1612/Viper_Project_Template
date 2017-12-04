//
//  UIVIewController.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Foundation


extension UIViewController {
	
	// Not using static as it wont be possible to override to provide custom storyboardID then
	class var storyboardID: String {
		return "\(self)"
	}
	
	static func instantiate(fromAppStoryboard appStoryboard: Storyboard) -> Self {
		
		return appStoryboard.viewController(viewControllerClass: self)
	}
    
    func animateView(duration: TimeInterval,
                             animation: @escaping () -> Void,
                             completion: @escaping (Bool) -> Void) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: duration, animations: {
            animation()
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, okayButtonTitle: String,
                   buttonAction: @escaping () -> Void ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let buttonAction = UIAlertAction(title: okayButtonTitle, style: .default) { (action) in
            buttonAction()
        }
        
        alertController.addAction(buttonAction)
        self.present(alertController, animated: true) {
            ()
        }
    }
    
    func showAlert(title: String, message: String,
                   primaryButtonTitle: String,
                   secondaryButtonTitle: String,
                   primaryButtonAction: @escaping () -> Void,
                   secondaryAction: @escaping () -> Void) {
        
        
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        
        let primaryActionButton = UIAlertAction(title: primaryButtonTitle, style: .destructive) { (action) in
            primaryButtonAction()
        }
        let secondaryActionButton = UIAlertAction(title: secondaryButtonTitle,
                                                  style: .default) { (action) in
                                                    secondaryAction()
        }
        alertController.addAction(secondaryActionButton)
        alertController.addAction(primaryActionButton)
        
        self.present(alertController, animated: true, completion: {})
        
    }
}

