//
//  MenubarCell.swift
//  NasaWorkdayApp
//
//  Created by Piyush Manghani on 7/3/23.
//

import UIKit

class MenubarCell: UITableViewCell {
    @IBOutlet weak var Item_img: UIImageView!
    
    @IBOutlet weak var item_date: UILabel!
    @IBOutlet weak var item_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
