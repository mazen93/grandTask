//
//  HomeVC.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit

class HomeVC: UIViewController {

 

    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var search:UISearchBar!
    private let viewModel = HomeViewModel()
    private let router = HomeRouter()
    
    
    private let segueIdentifier = "newsDetails"
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
 
    

    
    
    private func setupView(){
        router.viewController = self
        router.dataSource = viewModel
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        registerCell()
        
    }
    private func registerCell(){
        tableView.registerCell(ofType: HomeTableViewCell.self)
    }
    
    
    private func callApi(){
        viewModel.callAPI(pageNo: viewModel.pageNumber) { (success,error) in
            if error != nil {
                print("error \(error)")
            }else{
                self.tableView.reloadData()
            }
            
        }
    }

}


extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UIHelpers.emptyTableView(tableView: tableView, dataCount: viewModel.articles.count , dataCome: viewModel.dataNotCome, emptyMessage: "Search for everything")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueCell(for:indexPath) as HomeTableViewCell
        cell.configCell(model: viewModel.articles[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.article = viewModel.articles[indexPath.row]
        router.goToDetails()
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = viewModel.articles.count - 2
        if !viewModel.loadingData && indexPath.row == lastElement {
          
            viewModel.loadingData = true
            callApi()
        }
    }
    
    
}


extension HomeVC:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, !text.isEmpty else{return}
        
        viewModel.searchQuery =  text
        searchBar.endEditing(true)
        viewModel.pageNumber = 1
        callApi()
        
    }
}


