//
//  SettingsInteractor.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SettingsInteractor: SettingsInteractorInputProtocol,
    SettingsInteractorOutputProtocol{

    var presenter: SettingsPresenterProtocol?
    var APIDataManager: SettingsAPIDataManagerInputProtocol?
    var localDataManager: SettingsLocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = SettingsAPIDataManager()
        localDataManager = SettingsLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
}
