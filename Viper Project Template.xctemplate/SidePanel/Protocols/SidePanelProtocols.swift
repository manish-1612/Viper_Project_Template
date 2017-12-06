//
//  RiderSidePanelProtocols.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol SidePanelViewProtocol: class {
    var presenter: SidePanelPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func logoutUserRequestFailedWith(error : String)
    func logoutUserRequestSuccessful()

}

//MARK: Wireframe -
protocol SidePanelWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentSidePanelModule(fromWindow window: UIWindow)
    func presentSidePanelModule(fromNavView view: UINavigationController)
    func presentSidePanelModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
    func presentSidePanelControllerModule(fromWindow window: UIWindow,
                                         rootViewController: UIViewController)
    
    func presentLoginScreen()

}

//MARK: Presenter -
protocol SidePanelPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */
    
    
    func logoutUser()
    func logoutUserFailedWith(error : String)
    func logoutUserSuccessful()

    func presentLoginScreen()
    func showScreenWith(controller : UIViewController)
}

//MARK: Interactor -
protocol SidePanelInteractorInputProtocol: class {
    
    var presenter: SidePanelPresenterProtocol?  { get set }
    var APIDataManager: SidePanelAPIDataManagerInputProtocol? { get set }
    var localDataManager: SidePanelLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func logoutUser()
}
protocol SidePanelInteractorOutputProtocol: class {
    
    var presenter: SidePanelPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func directUserAsPerServerResponseForLogout(response : String)
}




//MARK: - DataManager -
protocol SidePanelDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol SidePanelAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
    
    func makeAPICallToLogoutUser()
}

//MARK: Local -
protocol SidePanelLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
