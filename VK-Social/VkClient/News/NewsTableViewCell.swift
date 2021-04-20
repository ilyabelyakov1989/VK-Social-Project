//
//  NewsTableViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 20.03.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var viewsNumber: UILabel!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        contentText.text = nil
        contentImage.image = nil
        
    }

}
