//
//  Double.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

extension Double {
    func round(to: Int) -> Double {
        let divisor = pow(10.0, Double(to))
        return Darwin.round(self * divisor) / divisor
    }
}
