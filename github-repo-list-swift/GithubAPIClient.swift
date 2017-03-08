//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    static func getRepositories(with completion: @escaping ([[String:Any]]) -> Void) {
        let urlString = "https://api.github.com/repositories?client_id=\(GitHub.ID)&client_secret=\(GitHub.secret)"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error)  in
                if let unwrappedData = data {
                    print(unwrappedData)
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String: Any]] ?? [[:]]
                        
                        completion(responseJSON)
                        
                        
                        
                    } catch {
                        
                    }
                }
                
                
            })
            dataTask.resume()
            
        }

        
    }
    
}
    


