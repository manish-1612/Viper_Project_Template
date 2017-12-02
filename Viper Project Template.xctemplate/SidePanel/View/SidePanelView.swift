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
    @IBOutlet weak var tableFooterVersionView: UIView!

    // ----------------------------------------------------------------
    //   RiderApp SideMenu Modules VC
    // ----------------------------------------------------------------
    
//    var homeView : HomeView?
    
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
        registerForNotifications()
        
        tableview.tableFooterView = tableFooterVersionView
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let appDependencies = appDelegate.appDependencies
        
//        editProfileView = appDependencies.editProfileWireframe.view
//        homeView = appDependencies.homeWireFrame.view
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
        
        //getRiderDetails()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerForNotifications(){
//        NotificationCenter.default.addObserver(self, selector: #selector(SidePanelView.handleUserUpdateNotification(notification:)), name: BRNotifications.riderProfileUpdate.name, object: nil)
        
       // NotificationCenter.default.addObserver(self, selector: #selector(SidePanelView.sessionExpired), name: BRNotifications.sessionOut.name, object: nil)
    }

    
    
}


//MARK:- Notifictaion selector
extension SidePanelView{
    
    /*
    func sessionExpired(){
        
        let alert = UIAlertController(title: "SessionExpired".localized, message: "SessionExpiredDesc".localized, preferredStyle: .alert)
        
        let logoutAction = UIAlertAction(title: "Okay".localized, style: .destructive) { (action) in
            self.presenter!.presentLoginScreen()
        }
        
        alert.addAction(logoutAction)
        self.sideMenuNavVC.present(alert, animated: true, completion: nil)
        
    }

    func handleUserUpdateNotification(notification: Notification){

        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableview.cellForRow(at: indexPath) as? BRProfilecell
        
        if let riderDetails = BRRiderProfileLocalStorage.shared.getRider(){
            if let firstName = riderDetails.firstName {
                if let lastName = riderDetails.lastName{
                    cell?.labelForUserName.text = "\(firstName) \(lastName)"
                }else{
                    Log.e("no name found for user")
                }
            }else{
                if let lastName = riderDetails.lastName{
                    cell?.labelForUserName.text = "\(lastName)"
                }else{
                    Log.e("no first name found for user")
                }
            }
            
            if let riderImage = riderDetails.photo{
                cell?.userImageView.sd_setImage(with: URL(string : riderImage), placeholderImage: UIImage(named : "SideMenuUserImageAvatar"), options: SDWebImageOptions.refreshCached)
            }
            
        }else{
            Log.s("No user details found")
        }
        
    }*/
}


//MARK:- UITableViewDataSource
extension SidePanelView : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int  {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        /*
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else if section == 2{
            return SideMenuRiderAppOptions.count
        }else{
            return 1
        }*/
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        /*
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier : "BRProfilecell") as? BRProfilecell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell?.availabilityStatusStack.isHidden = true
            
            if let riderDetails = BRRiderProfileLocalStorage.shared.getRider(){
                if let firstName = riderDetails.firstName {
                    if let lastName = riderDetails.lastName{
                        cell?.labelForUserName.text = "\(firstName) \(lastName)"
                    }else{
                        Log.e("no name found for user")
                    }
                }else{
                    if let lastName = riderDetails.lastName{
                        cell?.labelForUserName.text = "\(lastName)"
                    }else{
                        Log.e("no first name found for user")
                    }
                }
                
                
                if let riderImageUrl = riderDetails.photo{
                    cell?.userImageView.sd_setImage(with: URL(string: riderImageUrl), placeholderImage: UIImage(named: "SideMenuUserImageAvatar"), options: SDWebImageOptions.refreshCached)
                }else{
                    cell?.userImageView.image = UIImage(named: "SideMenuUserImageAvatar")
                }
                
            }else{
                Log.s("No user details found")
            }
            
            return cell!
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier : "BREmptycell") as? BREmptycell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier : "BRMenuCell") as? BRMenuCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            cell?.labelForMenuName.text = SideMenuRiderAppOptions.valueAtIndex(index: indexPath.row)
            cell?.configlabelForNotificationsCount()
            
            if SideMenuRiderAppOptions.valueAtIndex(index: indexPath.row) != SideMenuRiderAppOptions.notifications.rawValue{
                cell?.labelForNotificationsCount.isHidden = true
            }
            
            //since no push notifictaions, close count view
            cell?.labelForNotificationsCount.isHidden = true

            if selectedIndex.section == 2{
                if selectedIndex.row > -1{
                    if indexPath.row == selectedIndex.row{
                        cell?.labelForMenuName.textColor = BRColor.sidePanelTextActiveColor.value
                        cell?.imageForArrow.isHidden = false
                        
                    }else{
                        cell?.labelForMenuName.textColor = BRColor.sidePanelTextInactiveColor.value
                        cell?.imageForArrow.isHidden = true
                    }
                }else{
                    cell?.labelForMenuName.textColor = BRColor.sidePanelTextInactiveColor.value
                    cell?.imageForArrow.isHidden = true
                }
            }else{
                cell?.labelForMenuName.textColor = BRColor.sidePanelTextInactiveColor.value
                cell?.imageForArrow.isHidden = true
            }
            
            return cell!
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier : "BREmptycell") as? BREmptycell
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            return cell!
        }
    }*/
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier : "BRMenuCell") //as? BRMenuCell
        cell?.selectionStyle = UITableViewCellSelectionStyle.none

        return cell!
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
        
        /*
        if indexPath.section == 0{
            isFirstSelectionDone = true
            selectedIndex = indexPath
        }else if indexPath.section == 1{
            
        }else if indexPath.section == 2{
            if SideMenuRiderAppOptions.valueAtIndex(index: indexPath.row) == SideMenuRiderAppOptions.logout.rawValue{
                //do nothing
            }else{
                selectedIndex = indexPath
                isFirstSelectionDone = true

                let cell = tableView.cellForRow(at: indexPath) as? BRMenuCell
                cell?.labelForMenuName.textColor = BRColor.sidePanelTextActiveColor.value
                cell?.imageForArrow.isHidden = false
            }
        }else{
            
        }
        
        presentWireframeAsPerSelectedIndexPath(indexPath: indexPath)
        */

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        
        /*
        
        if indexPath.section == 0{
            
        }else if indexPath.section == 1{
            
        }else if indexPath.section == 2{
            if isFirstSelectionDone == true{
                let cell = tableView.cellForRow(at: indexPath) as? BRMenuCell
                cell?.labelForMenuName.textColor = BRColor.sidePanelTextInactiveColor.value
                cell?.imageForArrow.isHidden = true
            }
        }else{
            
        }
        */
    }
    
}

extension SidePanelView{
    
    func presentWireframeAsPerSelectedIndexPath(indexPath : IndexPath){
        
        /*
        
        switch indexPath.section{
        case 0 :
            
            editProfileView?.riderDetails = savedRiderDetails
            editProfileView?.disableSaveButton()
            sideMenuNavVC.popAllAndSwitch(to: editProfileView, withCompletion: {})

            
        case 2 :
            
            let optionSelected = SideMenuRiderAppOptions.valueAtIndex(index: indexPath.row)
            
            switch optionSelected {
            case SideMenuRiderAppOptions.bookARide.value:
                
                  switch sidePanelHomeState! {
                case .home:
                    homeView?.resetView()
                    sideMenuNavVC.popAllAndSwitch(to: homeView, withCompletion: {})

                case .bids:
                    sideMenuNavVC.popAllAndSwitch(to: bidListView, withCompletion: {})
                
                case .confirmAndPay:
                    sideMenuNavVC.popAllAndSwitch(to: confirmRideView, withCompletion: {})

                }
                
            case SideMenuRiderAppOptions.myRides.value:
                myRidesView!.shouldFetchTripList = true
                sideMenuNavVC.popAllAndSwitch(to: myRidesView, withCompletion: {})
                
            case SideMenuRiderAppOptions.payments.value:
                paymentsView!.shouldFetchCardlist = true
                sideMenuNavVC.popAllAndSwitch(to: paymentsView, withCompletion: {})
                
            case SideMenuRiderAppOptions.addressBook.value:
                addressBookView!.shouldFetchAddressBook = true
                sideMenuNavVC.popAllAndSwitch(to: addressBookView, withCompletion: {})

            case SideMenuRiderAppOptions.notifications.value:
                sideMenuNavVC.popAllAndSwitch(to: notificationsView, withCompletion: {})

                
            case SideMenuRiderAppOptions.logout.value:
                //logoutUser()
                // Close the SidePanel
                sideMenuNavVC.closeMenu(completion: {
                    // Do nothing
                })
                self.showAlert(title: "LogoutTitle".localized, message: "LogoutDesc".localized, primaryButtonTitle: "Logout".localized, secondaryButtonTitle: "KeyboardCancel".localized, primaryButtonAction: {
                    self.logoutUser()
                }, secondaryAction: { 
                    //nothing
                })
                
                
            default:
                break
            }
            
            
        default: break
        }
 
        */
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
    }
}

