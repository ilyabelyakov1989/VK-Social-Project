//
//  MyCustomSectionHeaderView.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit

class MyCustomSectionHeaderView: UITableViewHeaderFooterView {
   
    let title = UILabel()
    let gradient = CAGradientLayer()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.tintColor = .clear
        configureContents()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //self.contentView.frame = self.bounds
        gradient.frame = self.bounds
    }

    
    func configureContents() {
       
        gradient.colors = [UIColor.secondarySystemBackground.cgColor, UIColor.init(white: 1, alpha: 0).cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = .zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.opacity = 1
        gradient.frame = contentView.frame
        
        gradient.removeFromSuperlayer()
        contentView.layer.addSublayer(gradient)
 
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.font = .boldSystemFont(ofSize: 14)
        contentView.addSubview(title)
    
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.trailingAnchor.constraint(equalTo:contentView.layoutMarginsGuide.trailingAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
