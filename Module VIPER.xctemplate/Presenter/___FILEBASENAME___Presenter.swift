//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___VARIABLE_viperModuleName___Presenter: ___VARIABLE_viperModuleName___PresenterProtocol {

    weak private var view: ___VARIABLE_viperModuleName___ViewProtocol?
    private let interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol
    private let wireframe: ___VARIABLE_viperModuleName___WireframeProtocol

    init(interface: ___VARIABLE_viperModuleName___View, interactor: ___VARIABLE_viperModuleName___InteractorInputProtocol, wireframe: ___VARIABLE_viperModuleName___WireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
