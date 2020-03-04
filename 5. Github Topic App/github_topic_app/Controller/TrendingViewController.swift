//
//  TrendingViewController.swift
//  github_topic_app
//
//  Created by Dwi Randy Herdinanto on 01/03/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var repositoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.repositoryTableView.delegate = self
        self.repositoryTableView.dataSource = self
        self.repositoryTableView.reloadData()
        
        DownloadService.instance.downloadTrendingRepo { (repositories) in
            print(repositories[0])
        }
    }
}

extension TrendingViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trendingRepoCell", for: indexPath) as? TrendingRepoCell else { return UITableViewCell() }
        
        let repo = Repo(image: UIImage(named: "searchIconLarge")!, name: "SWIFT", description: "Apple Programming Language", numberOfForks: 36, language: "Swift", numberOfContributors: 572, repoUrl: "www.github.com")
        cell.configureCell(repo: repo)
        return cell
    }
    
    
}

extension TrendingViewController : UITableViewDelegate {
    
}
