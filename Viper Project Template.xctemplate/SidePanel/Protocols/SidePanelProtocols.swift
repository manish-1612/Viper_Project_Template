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
protocol RiderSidePanelViewProtocol: class {
    var presenter: RiderSidePanelPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    
    func logoutUserRequestFailedWith(error : String)
    func logoutUserRequestSuccessful()

}

//MARK: Wireframe -
protocol RiderSidePanelWireframeProtocol: class {
    var rootWireframe: RootWireframe { get set }
    func presentRiderSidePanelModule(fromWindow window: UIWindow)
    func presentRiderSidePanelModule(fromNavView view: UINavigationController)
    func presentRiderSidePanelModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
    func presentRiderSidePanelControllerModule(fromWindow window: UIWindow,
                                         rootViewController: UIViewController)
    
    func presentLoginScreen()

}

//MARK: Presenter -
protocol RiderSidePanelPresenterProtocol: class {
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
protocol RiderSidePanelInteractorInputProtocol: class {
    
    var presenter: RiderSidePanelPresenterProtocol?  { get set }
    var APIDataManager: RiderSidePanelAPIDataManagerInputProtocol? { get set }
    var localDataManager: RiderSidePanelLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func logoutUser()
}
protocol RiderSidePanelInteractorOutputProtocol: class {
    
    var presenter: RiderSidePanelPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    
    func directUserAsPerServerResponseForLogout(response : DataResponse<BRServerResponse<BRNil>>)
}




//MARK: - DataManager -
protocol RiderSidePanelDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol RiderSidePanelAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
    
    func makeAPICallToLogoutUser()
}

//MARK: Local -
protocol RiderSidePanelLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
