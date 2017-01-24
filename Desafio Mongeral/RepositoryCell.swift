//
//  RepositoryCell.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var labelNameRepository: UILabel!
    @IBOutlet weak var labelDescRepository: UILabel!
    @IBOutlet weak var labelNameAuthor: UILabel!
    @IBOutlet weak var labelCoutStars: UILabel!
    @IBOutlet weak var labelCoutForks: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var iconForksLabel: UILabel!
    @IBOutlet weak var iconStarsLabel: UILabel!
    
    
    var repository: RepositoryViewModel!
    
    
    func fill(with repository: RepositoryViewModel) {
        self.repository = repository
        
        let util: Util = Util()
        
        
        labelNameRepository.text = repository.name
        labelDescRepository.text = repository.description
        
        labelCoutForks.text = repository.forks
        labelCoutStars.text = repository.stars
        
        guard let owner = repository.owner else {
            return
        }
        
        if owner.name.isEmpty {
            GitHubClientRepository.getOwner(url: owner.url!) { (owner) in
                self.labelNameAuthor.text = owner?.name ?? ""
            }
        }
        
        avatarImage.image = util.downloaderImage(url: owner.avatarUrl)
        
        CSHelpers.makeRounded(imageView: avatarImage)
        avatarImage.layer.cornerRadius = 10
        
    }
    
}
