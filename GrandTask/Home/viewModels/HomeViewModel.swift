//
//  HomeViewModel.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation
protocol HomeDataSource {
    var article: Article? { get set }
}


class HomeViewModel: HomeDataSource {
    var article: Article?
    var pageNumber:Int = 1
    var searchQuery:String = ""
    var pageSize = 20
    var loadingData = false
    var articles :[Article] = []
     var isFetchingImages = false
    
    
    var dataNotCome = true
    
    
    
    internal func callAPI(pageNo:Int,completion:@escaping (_ success:Bool,_ error:String?) -> ()){
        
        
        guard !searchQuery.trimmingCharacters(in: .whitespaces).isEmpty else{return}
        
        
        loadingData = true
        let url = URLs.everythingUrl + "&q=\(searchQuery)" + "&page=\(pageNo)&pageSize=\(pageSize)"

        
        print("url \(url)")
        API.getPostData(url: url, method: .get, nil,nil) {
            [weak self ](data:NewsModel?, error) in
            guard let self=self else{return}
        
             if error != nil{
                 completion(false,error?.localizedDescription)
             
             }else{
                if data?.status == "ok"{
                    if data?.articles.isEmpty ==  false{
                        if self.pageNumber == 1 {
                            self.articles = data!.articles
                        }else{
                            self.articles.append(contentsOf: data!.articles)
                        }
                       
                        self.pageNumber += 1
                        self.loadingData = false
                        self.dataNotCome = false
                        completion(true,nil)
                    }
                }else{
                    completion(false,data?.message)
                }
            }
            
        }
    }
}



