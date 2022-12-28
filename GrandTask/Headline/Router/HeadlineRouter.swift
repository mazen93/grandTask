//
//  HeadlineRouter.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation
import UIKit

protocol HeadlinePassData {
    var dataSource: HeadlineDataSource? { get set }
}
protocol HeadlineRouterLogic {
    func goToDetails()
    
}
class HeadlineRouter: HeadlineRouterLogic, HeadlinePassData {
    var dataSource: HeadlineDataSource?
    
    weak var viewController: UIViewController?
    
    func goToDetails() {
        let vc = viewController?.storyboard?.instantiateViewController(withIdentifier: "HeadlineDetailsVC") as! HeadlineDetailsVC
        vc.viewModel.articleUrl = dataSource?.articleUrl
        viewController?.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
}
