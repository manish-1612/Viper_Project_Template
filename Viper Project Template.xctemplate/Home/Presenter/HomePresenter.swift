//
//  HomePresenter.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomePresenter: HomePresenterProtocol {

    weak private var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let wireframe: HomeWireframeProtocol

    init(interface: HomeView, interactor: HomeInteractorInputProtocol, wireframe: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
