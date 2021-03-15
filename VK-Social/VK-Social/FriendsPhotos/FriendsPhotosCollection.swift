//
//  FriendsPhotosCollection.swift
//  VK-Social
//
//  CCreated by Илья on 12.03.2021.
//

import UIKit

class FriendsPhotosCollection: UICollectionViewController {
    
    var currentFriend: FriendsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "background2")!)
        title = currentFriend?.name
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentFriend?.photosInAlbum.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotosCollectionCell", for: indexPath) as! FriendPhotosCell
        
        cell.friendPhoto.image = currentFriend?.photosInAlbum[indexPath.row]
        
        return cell
    }
}
