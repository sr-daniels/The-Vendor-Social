//
//  VendorTableViewCell.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 3/15/23.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var vendorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
