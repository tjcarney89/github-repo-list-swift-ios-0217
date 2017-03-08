//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    private init() {}
    var repositories = [GithubRepository]()
    
    func getRepositoriesFromAPI(completion: @escaping () -> Void) {
        
        GithubAPIClient.getRepositories(with: { json in
            self.repositories.removeAll()
            for dictionary in json {
                
                let repo = GithubRepository(dictionary: dictionary)
                self.repositories.append(repo)
            }
            
            print(self.repositories)
            completion()
            
        })
    }
    
}
