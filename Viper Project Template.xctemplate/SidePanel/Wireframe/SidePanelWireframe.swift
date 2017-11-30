//
//  RiderSidePanelWireframe.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SidePanelWireframe: SidePanelWireframeProtocol {
    
    var rootWireframe: RootWireframe = RootWireframe()
    var view: SidePanelView!
    var presentedView: UIViewController?
    var sideMenuController: SlideNavigationController!
    var loginWireframe : LoginWireframe?
    
    
    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = RiderSidePanelView.instantiate(fromAppStoryboard: .RiderSidePanel)
        let interactor = RiderSidePanelInteractor()
        let presenter = RiderSidePanelPresenter(interface: view, interactor: interactor, wireframe: self)
        view.presenter = presenter
        interactor.presenter = presenter
        
        
    }

}

// MARK: RiderSidePanelWireframeProtocol
extension SidePanelWireframe {
    
    func presentSidePanelControllerModule(fromWindow window: UIWindow,
                                      rootViewController: UIViewController) {

        sideMenuController = SlideNavigationController(rootViewController: rootViewController)
        sideMenuController.leftMenu = self.view
        
        createLeftMenuAndShowWith(window: window)
    }
    
    private func createLeftMenuAndShowWith(window: UIWindow){
        
        let leftMenuView = sideMenuController.leftMenu.view
        leftMenuView!.layer.shadowOffset = CGSize(width: 4.0, height: 0.0)
        leftMenuView!.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        leftMenuView?.layer.shadowRadius = 10.0
        leftMenuView?.layer.shadowOpacity = 0.5
        
        sideMenuController.leftMenuWidth = 240.0
        sideMenuController.needsOverlay = true
        sideMenuController.navigationBar.isHidden = true
        sideMenuController.enableSwipeGesture = true
        sideMenuController.enableShadow = true
        sideMenuController.avoidSwitchingToSameClassViewController = true
        
        window.rootViewController = sideMenuController
        window.makeKeyAndVisible()

    }

    func presentRiderSidePanelModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    
    
    func presentRiderSidePanelModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    
    // MARK: LoginWireframeProtocol
    func presentRiderSidePanelModule(fromWindow window: UIWindow) {
        self.rootWireframe.showRootViewController(self.view, inWindow: window)
    }
    
    func presentLoginScreen() {
        let newWidow = (UIApplication.shared.delegate as? BRRAppDelegate)?.window
        let navVC = UINavigationController(rootViewController: self.loginWireframe!.view)
        self.loginWireframe!.view.resetView()
        navVC.navigationBar.isHidden = true
        newWidow?.rootViewController = navVC
        newWidow?.makeKeyAndVisible()
    }

}
