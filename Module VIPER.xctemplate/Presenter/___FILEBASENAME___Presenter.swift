//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ___FILEBASENAME___Presenter: ___FILEBASENAME___PresenterProtocol {

    weak private var view: ___FILEBASENAME___ViewProtocol?
    private let interactor: ___FILEBASENAME___InteractorInputProtocol
    private let wireframe: ___FILEBASENAME___WireframeProtocol

    init(interface: ___FILEBASENAME___View, interactor: ___FILEBASENAME___InteractorInputProtocol, wireframe: ___FILEBASENAME___WireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
