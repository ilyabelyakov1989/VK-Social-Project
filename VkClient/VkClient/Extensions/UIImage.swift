//
//  UIImage.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit


extension UIImage {
    func getCropRatio() -> CGFloat {
        return  CGFloat( self.size.width / self.size.height )
    }
}
