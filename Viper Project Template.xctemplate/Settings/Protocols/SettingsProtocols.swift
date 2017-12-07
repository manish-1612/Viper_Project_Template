//
//  SettingsProtocols.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol SettingsViewProtocol: class {
    var presenter: SettingsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol SettingsWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentSettingsModule(fromWindow window: UIWindow)
    func presentSettingsModule(fromNavView view: UINavigationController)
    func presentSettingsModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol SettingsPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

}

//MARK: Interactor -
protocol SettingsInteractorInputProtocol: class {
    
    var presenter: SettingsPresenterProtocol?  { get set }
    var APIDataManager: SettingsAPIDataManagerInputProtocol? { get set }
    var localDataManager: SettingsLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
protocol SettingsInteractorOutputProtocol: class {
    
    var presenter: SettingsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol SettingsDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol SettingsAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
}

//MARK: Local -
protocol SettingsLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
