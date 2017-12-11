//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_viperModuleName___Wireframe: ___VARIABLE_viperModuleName___WireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: ___VARIABLE_viperModuleName___View!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = ___VARIABLE_viperModuleName___View.instantiate(fromAppStoryboard: .___VARIABLE_viperModuleName___)
        let interactor = ___VARIABLE_viperModuleName___Interactor()
        let presenter = ___VARIABLE_viperModuleName___Presenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: ___VARIABLE_viperModuleName___WireframeProtocol
extension ___VARIABLE_viperModuleName___Wireframe {
    func present___VARIABLE_viperModuleName___Module(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func present___VARIABLE_viperModuleName___Module(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func present___VARIABLE_viperModuleName___Module(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
}
