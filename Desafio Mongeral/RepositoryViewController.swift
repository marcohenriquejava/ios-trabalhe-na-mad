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
    
     var listItemsRepository = [RepositoryViewModel]()
    
    
    var cellSelectedRepo: RepositoryViewModel?
    
    
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
        return listItemsRepository.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_REPOSITORY, for: indexPath) as! RepositoryCell
        
        let repository = listItemsRepository[indexPath.item]
        cell.fill(with: repository)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelectedRepo = listItemsRepository[indexPath.item]
        //self.performSegue(withIdentifier: "showPullRequest", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPullRequest" {
            
            let indexPath = self.tableView.indexPathForSelectedRow
            
            
            
            let destination = segue.destination as! PullRequestViewController
          
            destination.urlPullRequest = self.listItemsRepository[(indexPath?.item)!].pullsUrlString
            
        }
    }
    
    
    func prepareObjectView() {
        guard let resultListRepo = searchResultRepo?.items else {
            NSLog(" Erro ao tentar constuir o resultado para a tela.")
            return
        }
        
        for resultItemRepo in resultListRepo {
            let itemVM = RepositoryViewModel(repository: resultItemRepo)
            self.listItemsRepository.append(itemVM)
        }
        
        self.tableView.reloadData()
    }
    
    
    func getListRepository() {
    
    
        GitHubClientRepository.getRepositories( completion: { result in
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
