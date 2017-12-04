//
//  BRRAppDependencies.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class AppDependencies {
    
    let rootWireframe = RootWireframe()

    let sidePanelWireframe = SidePanelWireframe()
    let loginWireFrame = LoginWireframe()

    static let shared = AppDependencies()
    
    
    init() {
        configureDependencies()
    }
    
    
    /// Function to initialize root view controller of the app
    ///
    /// - Parameter window: UIWindow
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        // TODO: Which module is going to be presented?
        
        loginWireFrame.presentLoginModule(fromWindow: window)
    }
    
    
    
    func configureDependencies() {
        
        // ----------------------------------------------------------------
        //   configuring wireframe dependencies
        // ----------------------------------------------------------------

        //sidepanel
        sidePanelWireframe.rootWireframe = rootWireframe
        sidePanelWireframe.loginWireframe = loginWireFrame
    }
    

}
