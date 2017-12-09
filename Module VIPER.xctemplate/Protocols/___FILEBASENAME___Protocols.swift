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
protocol ___FILEBASENAME___ViewProtocol: class {
    var presenter: ___FILEBASENAME___PresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol ___FILEBASENAME___WireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func present___FILEBASENAME___Module(fromWindow window: UIWindow)
    func present___FILEBASENAME___Module(fromNavView view: UINavigationController)
    func present___FILEBASENAME___Module(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol ___FILEBASENAME___PresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

}

//MARK: Interactor -
protocol ___FILEBASENAME___InteractorInputProtocol: class {
    
    var presenter: ___FILEBASENAME___PresenterProtocol?  { get set }
    var APIDataManager: ___FILEBASENAME___APIDataManagerInputProtocol? { get set }
    var localDataManager: ___FILEBASENAME___LocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
protocol ___FILEBASENAME___InteractorOutputProtocol: class {
    
    var presenter: ___FILEBASENAME___PresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol ___FILEBASENAME___DataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol ___FILEBASENAME___APIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
}

//MARK: Local -
protocol ___FILEBASENAME___LocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
