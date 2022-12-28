//
//  HeadlineDetailsViewModel.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation








protocol HeadlineDetailsDataSource {
    var articleUrl: String? { get set }
}

class HeadlineDetailsViewModel: HeadlineDetailsDataSource {
    var articleUrl: String?
    
}
