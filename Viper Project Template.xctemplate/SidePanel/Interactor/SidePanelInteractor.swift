//
//  SidePanelInteractor.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit


class  SidePanelInteractor:  SidePanelInteractorInputProtocol,
     SidePanelInteractorOutputProtocol{

    var presenter:  SidePanelPresenterProtocol?
    var APIDataManager:  SidePanelAPIDataManagerInputProtocol?
    var localDataManager:  SidePanelLocalDataManagerInputProtocol?
    
    init() {
        self.APIDataManager =  SidePanelAPIDataManager(interactor: self)
    }
}
