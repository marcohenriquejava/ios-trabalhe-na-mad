//
//  RepositoryViewController.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


class RepositoryViewController: UITableViewController {
    
    
    let CELL_REPOSITORY = "cellRepository"
  
    
    
    var searchResultRepo: SearchResultRepository?
    
     var items = [RepositoryObjectModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getListRepository()
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_REPOSITORY, for: indexPath) as! RepositoryCell
        
        let repository = items[indexPath.item]
        cell.fill(with: repository)
        
        return cell
    }
    
    
    func prepareObjectView() {
        guard let resultList = searchResultRepo?.items else {
            print(">> Erro ao tentar montar os resultados.")
            return
        }
        
        for resultItem in resultList {
            let itemVM = RepositoryObjectModel(repository: resultItem)
            self.items.append(itemVM)
        }
        
        self.tableView.reloadData()
    }
    
    func getListRepository() {
    
    
        GitHubClientRepository.searchRepositories( completion: { result in
            guard let result = result else {
                self.searchResultRepo = nil
                return
            }
            self.searchResultRepo = result
            self.prepareObjectView()
            
        })
    }
    
    
    func alert(message: String, title: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
    }

    
    
}
