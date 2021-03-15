//
//  GroupTableViewController.swift
//  VK-Social
//
//  Created by Илья on 10.03.2021.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var myGroupsInfo = [Groups(groupName: "Автомобили", groupAvatar: UIImage(named: "pug"), groupInfo: "Суперкары")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background2")!)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        tabBarController?.tabBar.backgroundImage = UIImage()
//        tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 0/0, green: 0/0, blue: 0/0, alpha: 1)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myGroupsInfo.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupsCell", for: indexPath) as! GroupTableViewCell
//        cell.groupAvatar.layer.cornerRadius = 25.0
//        cell.groupAvatar.layer.borderWidth = 1.0
//        cell.groupAvatar.clipsToBounds = true
        
//        cell. = myGroupsInfo[indexPath.row].groupAvatar
        cell.groupAvatar.avatarImageView.image = myGroupsInfo[indexPath.row].groupAvatar
        cell.groupName.text = myGroupsInfo[indexPath.row].groupName
        cell.groupInfo.text = myGroupsInfo[indexPath.row].groupInfo
        
        return cell
    }
    
    //MARK: - Func to append new groups to list
    @IBAction func addGroup(segue:UIStoryboardSegue) {
        if let addGroupsTableView = segue.source as? AllGroupsTableViewController ,
           let selectedIndexPath = addGroupsTableView.tableView.indexPathForSelectedRow {
            let selectedGroup = addGroupsTableView.groups[selectedIndexPath.row]
            if !myGroupsInfo.contains(selectedGroup){
                myGroupsInfo.append(selectedGroup)
                tableView.reloadData()
                
            }
        }
    }
    
    //MARK: - Func to remove groups from list
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroupsInfo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
