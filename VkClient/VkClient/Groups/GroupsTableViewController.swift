//
//  GroupsTableViewController.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import UIKit
import RealmSwift
//import Firebase

class GroupsTableViewController: UITableViewController {

    private var groups: Results<Group>!
    private var groupsBackup: Results<Group>!
    var token: NotificationToken?
    var isSearching: Bool = false
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        searchBar.delegate = self
        
        //загрузка данных из сети
        let networkService = NetworkServices()
        networkService.getUserGroups()
        
        //устанавливаем уведомления
        do {
            groups = try RealmService.load(typeOf: Group.self).sorted(byKeyPath: "name")
            /// подписываем
            if let groups = groups {
                addNotification(for: groups)
                groupsBackup = groups
            }
        }
        catch {
            print(error)
        }

    }
    
    func addNotification(for results: Results<Group>) {
        token = (results.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                self?.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                guard self?.isSearching == false else { return }
                tableView.beginUpdates()
                //tableView.reloadSections(IndexSet.init(integer: section), with: .automatic)
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                fatalError("\(error)")
            }
        })
    }
    
    deinit {
        token?.invalidate()
    }
        
    @objc
    func refresh(sender:AnyObject) {
        //загрузка данных из сети
        let networkService = NetworkServices()
        networkService.getUserGroups()
        self.refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupTableViewCell
        else { return UITableViewCell() }
        cell.populate(group: groups![indexPath.row])
        //cell.populate(group: filtredUserGroups[indexPath.row])
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //снимаем выделение
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension GroupsTableViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       //Throttled search
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(GroupsTableViewController.reload), object: nil)
            self.perform(#selector(GroupsTableViewController.reload), with: nil, afterDelay: 1)
        
    }
    
    @objc func reload() {
        guard let searchText = searchBar.text else { return }
        guard searchText != "" else {
            groups = groupsBackup
            isSearching = false
            tableView.reloadData()
            return
        }
        
        do {
            isSearching = true
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@"  , searchText.lowercased(), searchText.lowercased())
            let filteredGroups = try RealmService.load(typeOf: Group.self).sorted(byKeyPath: "name").filter(predicate)
            groups = filteredGroups
            //добавление результата в Firebase
           // addToFirebase(groups)
            tableView.reloadData()
        }
        catch {
            print(error)
        }
    }


    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
  
    /*
    func addToFirebase(_ result: Results<Group>) {
        let ref = Database.database(url: "https://vkclient-a78cb-default-rtdb.europe-west1.firebasedatabase.app/").reference(withPath: "users/" + (Session.shared.userId ?? "-1"))
        
        for group in result {
            let firebaseGroup = FirebaseGroup(id: "\(group.id)", name: group.name)
            let childRef = ref.child("group_search")
            let groupRef = childRef.child("\(group.id)")
            groupRef.setValue(firebaseGroup.toAnyObject())
        }
        //let firebaseUser = FirebaseUser(id: id ?? "-1", date: Int(Date().timeIntervalSince1970))
        
  
        
        //let userRef = ref.child(id ?? "-1")
       // userRef.setValue(firebaseUser.toAnyObject())
    }
*/
}
