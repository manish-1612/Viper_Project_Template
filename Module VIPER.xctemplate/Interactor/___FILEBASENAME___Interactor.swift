//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___FILEBASENAME___Interactor: ___FILEBASENAME___InteractorInputProtocol,
    ___FILEBASENAME___InteractorOutputProtocol{

    var presenter: ___FILEBASENAME___PresenterProtocol?
    var APIDataManager: ___FILEBASENAME___APIDataManagerInputProtocol?
    var localDataManager: ___FILEBASENAME___LocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = ___FILEBASENAME___APIDataManager()
        localDataManager = ___FILEBASENAME___LocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
}
