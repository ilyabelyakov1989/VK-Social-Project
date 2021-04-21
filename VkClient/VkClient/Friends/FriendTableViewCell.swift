//
//  FriendTableViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet var friendAvatar: CellLogo!
    @IBOutlet var friendName: UILabel!
    //для сохранения запрошенного адреса
    var imageURL: URL?

    override func prepareForReuse() {
        super.prepareForReuse()
        friendAvatar.logoView.image = nil
        friendName.text = nil
    }
    
    func populate(user: User) {
        imageURL = URL(string: user.avatarUrl)
        friendName.text = "\(user.firstName) \(user.lastName)"
        friendAvatar.logoView.download(from: imageURL!) {[weak self] url in
            self?.imageURL == url
        }
    }
    
    

}
