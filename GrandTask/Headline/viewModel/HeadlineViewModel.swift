//
//  HeadlineViewModel.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation




protocol HeadlineDataSource {
    var articleUrl: String? { get set }
}


class HeadlineViewModel: HeadlineDataSource {
    var articleUrl: String?
    var pageNumber:Int = 1
    var isLoadingData:Bool = false
    
    
    var isDataCome:Bool = false
    var articles :[Article] = []
    
    internal func callAPI(pageNo:Int,completion:@escaping (_ success:Bool,_ error:String?) -> ()){

        
        
        let url = URLs.topHeadlineUrl + "&page=\(pageNo)"
        print("url \(url)")
        API.getPostData(url: url, method: .get, nil,nil) {
            [weak self ](data:NewsModel?, error) in
            guard let self=self else{return}
            self.isLoadingData=true
             if error != nil{
                 completion(false,error?.localizedDescription)
            }else{
                if data?.status == "ok"{
                    
                    if data?.articles.isEmpty ==  false{
                        self.articles.append(contentsOf: data!.articles)
                        self.pageNumber += 1
                        self.isLoadingData=false
                        self.isDataCome=true
                        completion(true,nil)
                    }
                        
                    
                }else{
                    completion(false,data?.message)
                }
            }
            
        }


    }
    
    
    
    
    
    
    
    
}
