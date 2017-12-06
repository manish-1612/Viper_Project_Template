//
//  AppEnums.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation


public enum SideMenuAppOptions : String{
    
    case home = "HOME"
    case settings = "SETTINGS"
    case logout = "LOGOUT"
    
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    static let enumArray = [home, settings, logout]
    
    
    static let count: Int = {
        return SideMenuAppOptions.logout.hashValue + 1
    }()
    
    static func valueAtIndex(index : Int) -> String {
        return SideMenuAppOptions.enumArray[index].value
    }
    
}


