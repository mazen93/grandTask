//
//  API.swift
//  HAWHAW
//
//  Created by Mohamed on 7/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import Alamofire
import MOLH
class API {
    // singlton
    //MARK: create only one instense
    static let api=API()
    
    
    
  

    static func getPostData<T:Decodable>(url:String,method:HTTPMethod,_ paameters:Parameters?,_ headers:HTTPHeaders?,completion:@escaping (T?,Error?) -> ()) {
        
        AF.request(url, method: method, parameters:paameters ,encoding:JSONEncoding.default, headers: headers, interceptor: CustomInterceptor()).responseJSON  { (response) in
                        guard let data=response.data else {return}
                        switch response.result{
                        case .success(let v):
                          print(response)
                        do{
                   let data = try JSONDecoder().decode(T.self, from: data)
                         completion(data, nil)
                            }catch{
                                print(error)
                            }
                            
                        case .failure(let error):
                           print("errrrrrrrrrr\(error)error")
                         completion(nil, error)
                        }
                    }
       }
   
  
    
}

