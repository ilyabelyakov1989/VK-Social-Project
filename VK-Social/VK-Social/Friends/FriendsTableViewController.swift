//
//  FriendsTableViewController.swift
//  VK-Social
//
//  Created by Илья on 10.03.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    public var friendsData = [
        FriendsData(name: "Илья Беляков", message: "Добрый день!", photo: UIImage(named: "Ricardo Milos"), photosInAlbum: [UIImage(named: "rikardo1"), UIImage(named: "rikardo2"), UIImage(named: "rikardo3")]),
        FriendsData(name: "Валерий Иванов", message: "Хватит!", photo: UIImage(named: "bonk"), photosInAlbum: [UIImage(named: "bonk1"), UIImage(named: "bonk2"), UIImage(named: "bonk3")]),
        FriendsData(name: "Девушка Иванова", message: "Гуляю", photo: UIImage(named: "Joke"), photosInAlbum: [UIImage(named: "joke1"), UIImage(named: "joke2"), UIImage(named: "joke3")]),
//        FriendsData(name: "Pug", message: "Zzz Zzz Zzz", photo: UIImage(named: "sleeping pug"), photosInAlbum: [UIImage(named: "pug1"), UIImage(named: "pug2"), UIImage(named: "pug3")]),
//        FriendsData(name: "Man", message: "Why are you gay?", photo: UIImage(named: "why are you gae"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")]),
//        FriendsData(name: "Manuil", message: "Who om I?", photo: UIImage(named: "like.true"), photosInAlbum: [UIImage(named: "why1"), UIImage(named: "why2"), UIImage(named: "why3")])
    ].sorted(by: {$0.name < $1.name})
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background2")!)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
//
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return friendsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! FriendsTableViewCell
        
        cell.friendName.text = friendsData[indexPath.row].name
        cell.friendMessage.text = friendsData[indexPath.row].message
        cell.friendPhoto.avatarImageView.image = friendsData[indexPath.row].photo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - prepare segue to go to selected cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotos",
           let senderCell = sender as? FriendsTableViewCell,
           let friendCellIndexPath = tableView.indexPath(for: senderCell),
           let friendsPhotosCollectionController = segue.destination as? FriendsPhotosCollection {
            let selectedFriend = friendsData[friendCellIndexPath.row]
            friendsPhotosCollectionController.currentFriend = selectedFriend
        }
    }
    func getCharactersInArray () {
        let charactersInArrow = friendsData.map({$0.name.first!})
        var stringCharactersInArrow = [String] ()
        
        for characters in charactersInArrow{
            stringCharactersInArrow.append(String(characters))
        }
    }
}

