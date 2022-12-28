//
//  HeadlineVC.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit

class HeadlineVC: UIViewController {

    
    private let segueIdentifier = "headlineSegue"
    
    @IBOutlet weak var collectionView:UICollectionView!
  
    
    private let viewModel = HeadlineViewModel()
    private let router = HeadlineRouter()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
    }
    
    
    private func setupView(){
        router.viewController = self
        router.dataSource = viewModel
        registerCell()
        callApi()
    }
    
    
    
    
    private func callApi(){
        viewModel.callAPI(pageNo: viewModel.pageNumber) { (success,error) in
            if error != nil {
                print("error \(error)")
            }else{
                self.collectionView.reloadData()
            }
            
        }
    }
    private func registerCell(){
        collectionView.registerCell(ofType: headlineCell.self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
           if !viewModel.isLoadingData {
               viewModel.isLoadingData = true
               callApi()
           }
       }
   }

    

}


extension HeadlineVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        UIHelpers.emptyCollectionView(collectionView: collectionView, dataCount: viewModel.articles.count, dataCome: viewModel.isDataCome, emptyMessage: "no data available")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(for: indexPath)  as  headlineCell
        cell.configCell(model: viewModel.articles[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.articleUrl = viewModel.articles[indexPath.row].url ?? ""
        router.goToDetails()
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding:CGFloat = 4.0
        let numberOfRows:CGFloat = 2.0
        let width = (collectionView.frame.width - padding) / numberOfRows
        return CGSize(width: width, height: width)
    }
    
    
}

