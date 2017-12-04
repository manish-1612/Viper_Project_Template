//
//  SidePanelPresenter.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SidePanelPresenter: SidePanelPresenterProtocol {

    weak private var view: SidePanelViewProtocol?
    private let interactor: SidePanelInteractorInputProtocol
    private let wireframe: SidePanelWireframeProtocol

    init(interface: SidePanelView, interactor: SidePanelInteractorInputProtocol, wireframe: SidePanelWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }
    
    func presentLoginScreen() {
        self.wireframe.presentLoginScreen()
    }
    
    func showScreenWith(controller: UIViewController) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let window = appDelegate!.window
        
        self.wireframe.presentSidePanelControllerModule(fromWindow: window!, rootViewController: controller)
    }
    
    func logoutUser() {
        
    }
    
    func logoutUserFailedWith(error: String) {
        
    }
    
    func logoutUserSuccessful() {
        
    }


}
