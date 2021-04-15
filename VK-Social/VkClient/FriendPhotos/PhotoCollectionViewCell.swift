//
//  PhotoCollectionViewCell.swift
//  VkClient
//
//  Created by Ilya Belyakov on 27.03.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likeControl: LikeControl!
    
    var imageURL: URL? {
    didSet {
        photo?.image = nil
        updateUI()
        }
    }
    
    private func updateUI(){
        if let url = imageURL {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.photo.image = UIImage(data: imageData)
                    }
                }
            }
        }
        
    }
    
}
