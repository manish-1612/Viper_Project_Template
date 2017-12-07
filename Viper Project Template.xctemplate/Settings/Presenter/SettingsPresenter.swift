//
//  SettingsPresenter.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SettingsPresenter: SettingsPresenterProtocol {

    weak private var view: SettingsViewProtocol?
    private let interactor: SettingsInteractorInputProtocol
    private let wireframe: SettingsWireframeProtocol

    init(interface: SettingsView, interactor: SettingsInteractorInputProtocol, wireframe: SettingsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
