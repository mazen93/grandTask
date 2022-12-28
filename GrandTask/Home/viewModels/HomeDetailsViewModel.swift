//
//  HomeDetailsViewModel.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation

protocol HomeDetailsDataSource {
    var article: Article? { get set }
}

class HomeDetailsViewModel: HomeDetailsDataSource {
    var article: Article?
    
}
