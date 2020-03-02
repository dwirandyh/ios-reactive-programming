//
//  TrendingRepoCell.swift
//  github_topic_app
//
//  Created by Dwi Randy Herdinanto on 02/03/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import UIKit

class TrendingRepoCell: UITableViewCell {

    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repoDescriptionLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var contributorLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var numberOfForksLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var viewReadMeButton: RoundedBorderButton!
    
    private var repoUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Method to custom view
    override func layoutSubviews() {
        backView.layer.cornerRadius = 15
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.shadowOpacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func configureCell(repo: Repo){
        self.repoImageView.image = repo.image
        self.repoDescriptionLabel.text = repo.description
        self.repoNameLabel.text = repo.name
        self.contributorLabel.text = String(repo.numberOfContributors)
        self.languageLabel.text = repo.language
        self.numberOfForksLabel.text = String(repo.numberOfForks)
        
        repoUrl = repo.repoUrl
    }

}
