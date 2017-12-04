//
//  UILabel.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension UILabel {
	
	func startBlink() {
		UIView.animate(withDuration: 0.8,
		               delay:0.0,
		               options:[.autoreverse, .repeat],
		               animations: {
						self.alpha = 0
		}, completion: nil)
	}
	
	func stopBlink() {
		alpha = 1
		layer.removeAllAnimations()
	}
}
