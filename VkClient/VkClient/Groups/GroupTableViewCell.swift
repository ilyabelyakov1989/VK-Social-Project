//
//  GroupTableViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var groupLogo: CellLogo!
    @IBOutlet var groupName: UILabel!
    //для сохранения запрошенного адреса
    var imageURL: URL?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groupLogo.logoView.image = nil
        groupName.text = nil
    }
    
    func populate(group: Group) {
        imageURL = URL(string: group.avatarUrl)
        self.groupLogo.logoView.download(from:imageURL!) {[weak self] url in
            self?.imageURL == url
        }
        self.groupName.text = group.name
    }
    
  

}
