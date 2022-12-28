//
//  RoundGradientButton.swift
//  Puf
//
//  Created by AboNabih on 6/29/20.
//  Copyright © 2020 Elsayed Hussein. All rights reserved.
//

import Foundation

struct UserStatus {
  
    
    
    
    
 
    

    
    static var language: String{
        set {
            UserDefaults.standard.set(newValue, forKey: "language")
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: "language") ?? "ar-SA"
        }
    }
 
    
 
}

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}
enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}




