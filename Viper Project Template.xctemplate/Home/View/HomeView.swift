//
//  HomeView.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomeView: UIViewController, HomeViewProtocol {

	var presenter: HomePresenterProtocol?

    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK:- IBActions
    
    @IBAction func menuButtonClicked(_ sender: UIButton) {
        openSideMenu()
    }
    
    func openSideMenu(){
        SlideNavigationController.sharedInstance().open(MenuLeft, withCompletion: {})
        
    }

    
    
}
