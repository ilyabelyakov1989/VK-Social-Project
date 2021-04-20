//
//  FriendTableViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 27.03.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    
    @IBOutlet var friendAvatar: CellLogo!
    @IBOutlet var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
