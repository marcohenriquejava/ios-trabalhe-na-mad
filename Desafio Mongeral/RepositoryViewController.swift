//
//  RepositoryViewController.swift
//  Desafio Mongeral
//
//  Created by Marco Marques on 17/01/17.
//  Copyright © 2017 Marco Henrique Maia Marques. All rights reserved.
//

import UIKit


class RepositoryViewController: UITableViewController {
    
    var currentPage = 1
    
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
        
        let repository = listItemsRepository[indexPath.row]
        cell.fill(with: repository)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = listItemsRepository.count - 1
        if indexPath.row == lastElement {
            
            if listItemsRepository.count < (searchResultRepo?.totalCount ?? 0) {
                self.getListRepository()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPullRequest" {
            
            let destination = segue.destination as! PullRequestViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
              destination.urlPullRequest = self.listItemsRepository[indexPath.row].pullsUrlString
            }
         }
    }
    
    
    func prepareObjectView() {
        guard let resultListRepo = searchResultRepo?.items else {
            AlertFun.ShowAlert(title: "Alerta", message: "Nenhum repositório encontrado!", in: self)
            return
        }
        
        for resultItemRepo in resultListRepo {
            let itemVM = RepositoryViewModel(repository: resultItemRepo)
            self.listItemsRepository.append(itemVM)
        }
        
        self.tableView.reloadData()
    }
    
    
    func getListRepository() {
    
        if self.listItemsRepository.count < (searchResultRepo?.totalCount ?? 0) {
            currentPage += 1
        }
        
        GitHubClientRepository.getRepositories(page: currentPage, completion: { result in
            guard let result = result else {
                self.searchResultRepo = nil
                AlertFun.ShowAlert(title: "Alerta", message: "Nenhum repositório encontrado!", in: self)
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
