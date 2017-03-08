//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName: String
    var htmlURL: URL
    var repositoryID: String
    
    init(fullName: String, htmlURL: URL, repositoryID: String) {
        self.fullName = fullName
        self.htmlURL = htmlURL
        self.repositoryID = repositoryID
    }
    
    init(dictionary: [String: Any]) {
        fullName = dictionary["full_name"] as? String ?? "No Name"
        guard let urlString = dictionary["html_url"] as? String, let newURL = URL(string: urlString) else { fatalError("Bad URL") }
        htmlURL = newURL
        let numID = dictionary["id"] as? Int ?? 0
        repositoryID = String(describing: numID)
    }
    

    
}

extension GithubRepository: CustomStringConvertible {
    var description: String {
        return "Name: \(fullName), HTML URL: \(htmlURL), RepoID: \(repositoryID)"
    }
}
