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
    
    
    
    var repo: RepositoryViewModel!
    
    
    func fill(with repo: RepositoryViewModel) {
        self.repo = repo
        
        
        let util: Util = Util()
        
        labelNameAuthor.text = repo.name
        labelDescRepository.text = repo.description
        
        labelCoutForks.text = repo.forks
        labelCoutStars.text = repo.stars
        
        guard let owner = repo.owner else {
            return
        }
        
        labelNameAuthor.text = owner.name
        avatarImage.image = util.downloaderImage(url: owner.avatarUrl)
        avatarImage.layer.cornerRadius = 10
        
    }
    
}
