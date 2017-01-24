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
        
        //createAtLabel.text = CSHelperDate.formatterBR.string(from: pullReq.createdAt)
        
        guard let owner = pullRequest.owner else {
            return
        }
        userLoginLabel.text = owner.login
        
       // userAvatarImage.setImage(url: owner.avatarUrl)
        //CSHelpers.makeRounded(imageView: userAvatarImage)
        
        
       userAvatarImage.layer.cornerRadius = 10
        
    }
    
    
    
    
}
