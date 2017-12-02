//
//  SidePanelAPIDataManager.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SidePanelAPIDataManager: SidePanelAPIDataManagerInputProtocol {


    private let interactor : SidePanelInteractorOutputProtocol?
    
    init(interactor : SidePanelInteractorOutputProtocol) {
        self.interactor = interactor
    }
    
    func makeAPICallToLogoutUser() {
        
    }
    


}
