//
//  AllGroupsTableViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 20.03.2021.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet var groupImage: UIImageView!
    @IBOutlet var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
