//
//  LoginPresenter.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LoginPresenter: LoginPresenterPresenterProtocol {

    weak private var view: LoginPresenterViewProtocol?
    private let interactor: LoginInteractorInputProtocol
    private let wireframe: LoginWireframeProtocol

    init(interface: LoginView, interactor: LoginInteractorInputProtocol, wireframe: LoginWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
