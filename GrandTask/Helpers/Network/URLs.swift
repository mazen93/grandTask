//
//  URLs.swift
//  HAWHAW
//
//  Created by Mohamed on 8/12/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import MOLH
struct URLs {
    
    
    
    // MAIN
    static let main = "https://newsapi.org/v2/"
    
    
    
    static let apiKey = "apiKey=8a080d75282d4d0a9b9eacc604b850b1"
    
    static let topHeadline = "top-headlines?country=us&" + apiKey
    
    
    static let everything = "everything?" + apiKey
    
    
    
    static let topHeadlineUrl = main + topHeadline
    
    static let everythingUrl = main + everything
    
    
}


