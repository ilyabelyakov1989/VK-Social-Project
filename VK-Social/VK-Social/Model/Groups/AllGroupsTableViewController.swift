//
//  AllGroupsTableViewController.swift
//  VK-Social
//
//  Created by Илья on 10.03.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    var groups = [
        "Фильмы",
        "Новости",
        "Обучение",
        "Английский язык",
        "Афиша"
    ]
    var selectedGroup: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GroupTableViewCell
        let group = groups[indexPath.row]
        cell.titleLable.text = group

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedGroup = groups[indexPath.row]
        performSegue(withIdentifier: "addGroup", sender: self)
    }



}
