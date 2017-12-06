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
    
    var rootWireframe: RootWireframe?
    var view: SidePanelView!
    var presentedView: UIViewController?
    var sideMenuController: SlideNavigationController!
    var loginWireframe : LoginWireframe?
    
    
    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = SidePanelView.instantiate(fromAppStoryboard: .SidePanel)
        let interactor = SidePanelInteractor()
        let presenter = SidePanelPresenter(interface: view, interactor: interactor, wireframe: self)
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
       
        if self.view.tableview != nil{
            self.view.tableview.selectRow(at: IndexPath(row: 0, section: 2), animated: false, scrollPosition: .top)
        }

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

    func presentSidePanelModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    
    
    func presentSidePanelModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    
    // MARK: LoginWireframeProtocol
    func presentSidePanelModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }

    func presentLoginScreen() {
        let newWidow = (UIApplication.shared.delegate as? AppDelegate)?.window
        let navVC = UINavigationController(rootViewController: self.loginWireframe!.view)
        navVC.navigationBar.isHidden = true
        newWidow?.rootViewController = navVC
        newWidow?.makeKeyAndVisible()
    }

}
