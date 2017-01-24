//
//  PullRequestCell.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 21/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit



class PullRequestCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleLabelPullRequest: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var userLoginLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAvatarImage: UIImageView!
    
    
    
    func fill(with pullRequest: PullRequestViewModel) {
        
        
        titleLabelPullRequest.text = pullRequest.title
        bodyLabel.text = pullRequest.body
        
        
        let util: Util = Util()
        
        createAtLabel.text = CSHelperDate.formatterBR.string(from: pullRequest.dataCreate)
        
        guard let owner = pullRequest.owner else {
            return
        }
        
        if owner.name.isEmpty {
            GitHubClientRepository.getOwner(url: owner.url!) { (owner) in
                self.userNameLabel.text = owner?.name ?? ""
            }
        }
        
        userLoginLabel.text = owner.login
        
        userAvatarImage.image = util.downloaderImage(url: owner.avatarUrl)
        CSHelpers.makeRounded(imageView: userAvatarImage)
        
        userAvatarImage.layer.cornerRadius = 10
        
    }
    
    
    
    
}
