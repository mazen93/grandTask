//
//  Extensions.swift
//  AbsherInterior
//
//  Created by Elsayed Hussein on 10/22/21.
//

import UIKit
import MOLH

extension String {
    var relativeDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
        if let date = dateFormatter.date(from: self) {
            
            
            
            
            let relativeFormatter = RelativeDateTimeFormatter()
            
            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
            return relativeDate
        }
//        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat =  "hh:mm a"
        if let date = dateFormatter.date(from: self) {
            let relativeFormatter = RelativeDateTimeFormatter()
            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
            return relativeDate
        }
        return self
    }
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        if let date = dateFormatter.date(from: self) {
            return date
        }
        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: self) {
            return date
        }
        return nil
    }
    

    
    
    var relativeDate3: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
       dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
        if let date = dateFormatter.date(from: self) {
            let relativeFormatter = RelativeDateTimeFormatter()
            
            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
            return relativeDate
        }
//        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat =  "hh:mm a"
        if let date = dateFormatter.date(from: self) {
            let relativeFormatter = RelativeDateTimeFormatter()
            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
            return relativeDate
        }
        return self
    }
    
    
    
    
    
    
    var relativeDate7: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
        if let date = dateFormatter.date(from: self) {
            
            
            
            if date.hasSame(.year, as: Date()) {
                
                let datey = dateFormatter.date(from:self)!
                
//                if datey!.timeIntervalSinceNow.sign == .minus {
//                    //myDate is earlier than Now (date and time)
//                    print("myDate is earlier than Now (date and time")
//                } else {
//                    //myDate is equal or after than Now (date and time)
//
//                    print("myDate is equal or after than Now (date and time)")
//                }
                
                
                
                print("Calendar.current.isDateInToday(datey) \(Calendar.current.isDateInToday(datey))")
                
                
                
                if Calendar.current.isDateInToday(datey) {
                    // today
                    
                                let relativeFormatter = RelativeDateTimeFormatter()
                    
                                let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
                                return relativeDate
                    
                }else{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                    if let date = dateFormatter.date(from: self) {
                        print(date)
                        dateFormatter.dateFormat = "MM-dd HH:mm"
                        return dateFormatter.string(from: date)
                    }
                }
                
                
             
                
              //  return   formattedDate
                
                
              //  print("today  date is \(Date())")
                
                
//                print("date.hasSame(.day, as: Date()) \(date.hasSame(.weekday, as: Date()))")
//                if date.hasSame(.day, as: Date()) {
//
//                }
//
            }else{
                print("not same year ")
            }
            
            
//            let relativeFormatter = RelativeDateTimeFormatter()
//
//            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
//            return relativeDate
        }
//        dateFormatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.dateFormat =  "hh:mm a"
        if let date = dateFormatter.date(from: self) {
            let relativeFormatter = RelativeDateTimeFormatter()
            let relativeDate = relativeFormatter.localizedString(for: date, relativeTo: Date())
            return relativeDate
        }
        return self
    }
    
    
    
}
extension NSTextAlignment {
    static var localizedTextAlignment: NSTextAlignment {
        MOLHLanguage.isArabic() ? .right : .left
    }
}
extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension Date {
    func hasSame(_ components: Calendar.Component..., as date: Date, using calendar: Calendar = .autoupdatingCurrent) -> Bool {
             return components.filter { calendar.component($0, from: date) != calendar.component($0, from: self) }.isEmpty
    }
}




extension String {
    var formattedDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        if let date = dateFormatter.date(from: self) {
            print(date)
            dateFormatter.dateFormat = "MM-dd"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


extension Date {
    var isPastDate: Bool {
        return self < Date()
    }
}
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attrString = label.attributedText else {
            return false
        }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .zero)
        let textStorage = NSTextStorage(attributedString: attrString)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}



extension Notification.Name {
static let notificationBell = Notification.Name("notificationBell")
static let removeNotificationBell = Notification.Name("removeNotificationBell")
static let adminNotification = Notification.Name(rawValue: "adminNotification")
static let pollNotification = Notification.Name(rawValue: "pollNotification")
static let searchNotification = Notification.Name(rawValue: "searchNotification")
  
    
}

