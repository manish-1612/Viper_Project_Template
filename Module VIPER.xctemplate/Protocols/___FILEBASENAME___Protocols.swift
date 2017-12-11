//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol ___VARIABLE_viperModuleName___ViewProtocol: class {
    var presenter: ___VARIABLE_viperModuleName___PresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol ___VARIABLE_viperModuleName___WireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func present___VARIABLE_viperModuleName___Module(fromWindow window: UIWindow)
    func present___VARIABLE_viperModuleName___Module(fromNavView view: UINavigationController)
    func present___VARIABLE_viperModuleName___Module(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol ___VARIABLE_viperModuleName___PresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

}

//MARK: Interactor -
protocol ___VARIABLE_viperModuleName___InteractorInputProtocol: class {
    
    var presenter: ___VARIABLE_viperModuleName___PresenterProtocol?  { get set }
    var APIDataManager: ___VARIABLE_viperModuleName___APIDataManagerInputProtocol? { get set }
    var localDataManager: ___VARIABLE_viperModuleName___LocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
protocol ___VARIABLE_viperModuleName___InteractorOutputProtocol: class {
    
    var presenter: ___VARIABLE_viperModuleName___PresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol ___VARIABLE_viperModuleName___DataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol ___VARIABLE_viperModuleName___APIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
}

//MARK: Local -
protocol ___VARIABLE_viperModuleName___LocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
