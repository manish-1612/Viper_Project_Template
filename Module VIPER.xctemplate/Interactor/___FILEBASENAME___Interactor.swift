//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_viperModuleName___Interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol,
    ___VARIABLE_viperModuleName___InteractorOutputProtocol{

    var presenter: ___VARIABLE_viperModuleName___PresenterProtocol?
    var APIDataManager: ___VARIABLE_viperModuleName___APIDataManagerInputProtocol?
    var localDataManager: ___VARIABLE_viperModuleName___LocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = ___VARIABLE_viperModuleName___APIDataManager()
        localDataManager = ___VARIABLE_viperModuleName___LocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
}
