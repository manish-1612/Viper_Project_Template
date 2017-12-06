//
//  RiderSidePanelView.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit


class SidePanelView: UIViewController, SidePanelViewProtocol {

	var presenter: SidePanelPresenterProtocol?

    @IBOutlet weak var tableview: UITableView!
    
    var homeView : HomeView?
    var isFirstSelectionDone = false
    var selectedIndex : IndexPath = IndexPath(row: 0, section: 2) {
        didSet {
            if let tableView = self.tableview {
                tableView.reloadSections([2], with: .none)
            }
        }
    }

    
    var sideMenuNavVC: SlideNavigationController {
        return SlideNavigationController.sharedInstance()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let appDependencies = appDelegate.appDependencies
       
        homeView = appDependencies.homeWireframe.view

//        editProfileView = appDependencies.editProfileWireframe.view
//        bidListView = appDependencies.bidListWireframe.view
//        myRidesView = appDependencies.myRidesWireFrame.view
//        paymentsView = appDependencies.paymentsWireFrame.view
//        addressBookView = appDependencies.addressBookWireframe.view
//        notificationsView = appDependencies.notificationsWireframe.view
//        subscriptionView = appDependencies.subscriptionWireframe.view
//        subscriptionView = appDependencies.subscriptionWireframe.view
//        confirmRideView = appDependencies.confirmRideWireframe.view
//        loginWireframe = appDependencies.loginWireFrame
    
    
        
    }
    
    override func viewWillAppear(_ animated : Bool){
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//MARK:- UITableViewDataSource
extension SidePanelView : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int  {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return SideMenuAppOptions.count
        }else{
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier : "Profilecell") as? Profilecell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell?.labelForUserName.text = "Manish Kumar"
            return cell!
            
        }else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier : "Emptycell") as? Emptycell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
            
        }else if indexPath.section == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier : "MenuCell") as? MenuCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell?.labelForMenuName.text = SideMenuAppOptions.valueAtIndex(index: indexPath.row)
            
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier : "Emptycell") as? Emptycell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }
        
    }
}

//MARK:- UITableViewDelegatewokring
extension SidePanelView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath : IndexPath) -> CGFloat{
        
        if indexPath.section == 0{
            return 110.0
        }else if indexPath.section == 1{
            return 52.0
        }else if indexPath.section == 2{
            return 50.0
        }else{
            return 52.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if indexPath.section == 0{
            isFirstSelectionDone = true
            selectedIndex = indexPath
        }else if indexPath.section == 1{
            
        }else if indexPath.section == 2{
            if SideMenuAppOptions.valueAtIndex(index: indexPath.row) == SideMenuAppOptions.logout.rawValue{
                //do nothing
            }else{
                selectedIndex = indexPath
                isFirstSelectionDone = true
            }
        }else{
            
        }
        
        presentWireframeAsPerSelectedIndexPath(indexPath: indexPath)

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
    
    }
    
}

extension SidePanelView{
    
    func presentWireframeAsPerSelectedIndexPath(indexPath : IndexPath){
        
        
        switch indexPath.section{
        case 0 :
            print("option for edit profile")
            //editProfileView?.riderDetails = savedRiderDetails

        case 2 :
            let optionSelected = SideMenuAppOptions.valueAtIndex(index: indexPath.row)
            
            switch optionSelected {
            case SideMenuAppOptions.home.value:
                
                sideMenuNavVC.popAllAndSwitch(to: homeView, withCompletion: {})

                
            case SideMenuAppOptions.settings.value:
                print("option for settings page")
                //sideMenuNavVC.popAllAndSwitch(to: myRidesView, withCompletion: {})
                
                
            case SideMenuAppOptions.logout.value:
                //logoutUser()
                // Close the SidePanel
                sideMenuNavVC.closeMenu(completion: {
                    // Do nothing
                })
                self.showAlert(title: "Logout".localized, message: "Are you sure you want to logout".localized, primaryButtonTitle: "Logout".localized, secondaryButtonTitle: "Cancel".localized, primaryButtonAction: {
                    //self.logoutUser()
                    self.logoutUserRequestSuccessful()
                }, secondaryAction: {
                    //nothing
                })

                
            default:
                break
            }
            
            
        default: break
        }
    }
    
    
    
    
    func logoutUser(){
        self.presenter?.logoutUser()
    }
}


extension SidePanelView{
    
    func logoutUserRequestFailedWith(error : String){

    }
    
    func logoutUserRequestSuccessful(){
        self.selectedIndex = IndexPath(row: 0, section: 2)
        self.presenter!.presentLoginScreen()

    }
}

