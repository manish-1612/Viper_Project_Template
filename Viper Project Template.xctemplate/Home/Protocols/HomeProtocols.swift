//
//  HomeProtocols.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol HomeViewProtocol: class {
    var presenter: HomePresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol HomeWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentHomeModule(fromWindow window: UIWindow)
    func presentHomeModule(fromNavView view: UINavigationController)
    func presentHomeModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol HomePresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

}

//MARK: Interactor -
protocol HomeInteractorInputProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
    var APIDataManager: HomeAPIDataManagerInputProtocol? { get set }
    var localDataManager: HomeLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
protocol HomeInteractorOutputProtocol: class {
    
    var presenter: HomePresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol HomeDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol HomeAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
}

//MARK: Local -
protocol HomeLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
