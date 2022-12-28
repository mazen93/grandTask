//
//  HomeRouter.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation
import UIKit

protocol HomePassData {
    var dataSource: HomeDataSource? { get set }
}
protocol HomeRouterLogic {
    func goToDetails()
    
}
class HomeRouter: HomeRouterLogic, HomePassData {
    var dataSource: HomeDataSource?
    
    weak var viewController: UIViewController?
    
    func goToDetails() {
        let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "HomeDetailsVC") as! HomeDetailsVC
        vc.viewModel.article = dataSource?.article
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
}
