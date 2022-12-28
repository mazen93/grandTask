//
//  HeadlineDetailsVC.swift
//  GrandTask
//
//  Created by host on 26/12/2022.
//

import UIKit
import WebKit
class HeadlineDetailsVC: UIViewController,WKNavigationDelegate {

    
    
    @IBOutlet weak var web:WKWebView!
     let viewModel = HeadlineDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: viewModel.articleUrl ?? "")
        let request = URLRequest(url: url!)
        web.load(request)
        

    }
    

  

}
