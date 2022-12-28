//
//  Date+Ex.swift
//  Absher
//
//  Created by Mostafa  on 28/12/2021.
//

import Foundation


extension Date {
    
    func customDate(_ date: String)-> String{
        
        let dateFormatter = DateFormatter()
       if UserStatus.language != "en" { dateFormatter.locale = Locale(identifier: "ar")
        }else { dateFormatter.locale = Locale(identifier: "en") }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if  let date = dateFormatter.date(from:date) {
            
            dateFormatter.dateFormat = "d MMMM yyyy 'At' h a"
            if UserStatus.language != "en" { dateFormatter.dateFormat = "d MMMM yyyy 'في' h a" }
            return dateFormatter.string(from: date)
        }
       return date
    }
    
    
    
    
    
    
    func utcToLocal(dateStr: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "hh:mm a"
        
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    
 

    
}

