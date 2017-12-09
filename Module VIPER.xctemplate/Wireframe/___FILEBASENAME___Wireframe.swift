//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___FILEBASENAME___Wireframe: ___FILEBASENAME___WireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: ___FILEBASENAME___View!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = ___FILEBASENAME___View.instantiate(fromAppStoryboard: .___FILEBASENAME___)
        let interactor = ___FILEBASENAME___Interactor()
        let presenter = ___FILEBASENAME___Presenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: ___FILEBASENAME___WireframeProtocol
extension ___FILEBASENAME___Wireframe {
    func present___FILEBASENAME___Module(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func present___FILEBASENAME___Module(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func present___FILEBASENAME___Module(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
}
