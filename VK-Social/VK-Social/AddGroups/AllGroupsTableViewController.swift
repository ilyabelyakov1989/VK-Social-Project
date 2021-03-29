//
//  AllGroupsTableViewController.swift
//  VK-Social
//
//  Created by Илья on 10.03.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    var groups = [ Groups(groupName: "Ноги", groupAvatar: UIImage(named: "Ricardo Milos"), groupInfo: "Болят")]

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background2")!)
//            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addGroupsCell", for: indexPath) as! AddGroupsCell
        
        cell.addGroupAvatar.layer.cornerRadius = 25.0
        cell.addGroupAvatar.layer.borderWidth = 1.0
        cell.addGroupAvatar.clipsToBounds = true

        cell.addGroupAvatar.avatarImageView.image = groups[indexPath.row].groupAvatar
        cell.addGroupName.text = groups[indexPath.row].groupName
        cell.addGroupInfo.text = groups[indexPath.row].groupInfo

        return cell
    }
}
