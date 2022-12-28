//
//  CustomIntrupter.swift
//  HAWHAW
//
//  Created by Mohamed Macbook on 3/31/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import Foundation
import Alamofire
class CustomInterceptor :RequestInterceptor{
    private let retryLimit=5
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        if let statusCode = request.response?.statusCode,statusCode == 401,request.retryCount < retryLimit{
            completion(.retryWithDelay(2))
        }else{
            completion(.doNotRetry)
        }
    }
}
