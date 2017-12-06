//
//  Profilecell.swift
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BRProfilecellDelegate: class {
    func switchDidChangeState(sender: UISwitch)
}

class Profilecell: UITableViewCell {

    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var labelForUserName: UILabel!
    
    
    weak var delegate:BRProfilecellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
