//
//  MenuCell.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import QuartzCore

class MenuCell: UITableViewCell {

    
    @IBOutlet weak var labelForMenuName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CALayer {
    var borderColorFromUIColor: UIColor {
        get {
            return UIColor(cgColor : self.borderColor!)
        } set {
            self.borderColor = newValue.cgColor
        }
    }
}

extension MenuCell{
    

}
