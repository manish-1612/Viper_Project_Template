//
//  SettingsWireframe.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SettingsWireframe: SettingsWireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: SettingsView!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = SettingsView.instantiate(fromAppStoryboard: .Settings)
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: SettingsWireframeProtocol
extension SettingsWireframe {
    func presentSettingsModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func presentSettingsModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: SettingsWireframeProtocol
    func presentSettingsModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
}
