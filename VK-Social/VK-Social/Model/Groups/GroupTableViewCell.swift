//
//  GroupTableViewCell.swift
//  VK-Social
//
//  Created by Илья on 10.03.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLable.text = ""
    }
    
}
