//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityLabel = "tableView"
        tableView.accessibilityIdentifier = "tableView"
        store.getRepositoriesFromAPI(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    
        
    }
    


    // MARK: - Table view data source
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        let currentRepo = store.repositories[indexPath.row].fullName
        cell.textLabel?.text = "\(currentRepo)"
        return cell
    }

}
