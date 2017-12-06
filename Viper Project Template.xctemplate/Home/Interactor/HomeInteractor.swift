//
//  HomeInteractor.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomeInteractor: HomeInteractorInputProtocol,
    HomeInteractorOutputProtocol{

    var presenter: HomePresenterProtocol?
    var APIDataManager: HomeAPIDataManagerInputProtocol?
    var localDataManager: HomeLocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = HomeAPIDataManager()
        localDataManager = HomeLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
}
