//
//  DownloadService.swift
//  github_topic_app
//
//  Created by Dwi Randy Herdinanto on 04/03/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import Foundation
import Alamofire

class DownloadService {
    static let instance = DownloadService()
    
    private func downloadTrendingReposDictArray(completion: @escaping (_ reposDictArray: [Dictionary<String,Any>]) -> ()){
        
        var trendingReposArray = [Dictionary<String, Any>]()
        
        Alamofire.request(trendingRepoUrl).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String, Any> else { return }
            guard let repoDictionaryArray = json["items"] as? [Dictionary<String, Any>] else { return }
            for repo in repoDictionaryArray {
                if trendingReposArray.count <= 10 {
                    trendingReposArray.append(repo)
                } else {
                    break;
                }
            }
            
            completion(trendingReposArray)
        }
    }
    
    func downloadTrendingRepo(completion: @escaping (_ reposArray: [Repo]) -> ()){
        self.downloadTrendingReposDictArray { (repoDictionary) in
            var trendingRepos : [Repo] = [Repo]()
            for dict in repoDictionary {
                trendingRepos.append(self.mapToRepo(fromDictionary: dict))
            }
            
            completion(trendingRepos)
        }
    }
    
    private func mapToRepo(fromDictionary dict: Dictionary<String, Any>) -> Repo {
//        let avatarUrl = dict["avatar_url"] as! String
        let name = dict["name"] as! String
        let description = dict["description"] as! String
        let numberOfForks = dict["forks_count"] as! Int
        let language = dict["language"] as? String
        let numberOfContributors = 0
        let repoUrl = dict["html_url"] as! String
        
        let repo = Repo(image: UIImage(named: "searchIconLarge")!, name: name, description: description, numberOfForks: numberOfForks, language: language ?? "", numberOfContributors: numberOfContributors, repoUrl: repoUrl)
        
        return repo
    }
}
