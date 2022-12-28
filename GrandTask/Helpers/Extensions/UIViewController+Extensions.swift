//
//  UIViewController+Extensions.swift
//  AbsherInterior
//
//  Created by Ahmed Abdelkarim on 02/10/2021.
//

import UIKit
var vSpinner: UIView?
extension UIViewController {
    /// Initialize view controller from a storyboard. The view controller must have storyboard Id set with its exact name for this function to work.
    static func initFromStoryboard<T: UIViewController>(storyboardName: String) -> T? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "\(String(describing: self))") as? T
        
        return viewController
    }
    
    
    /// Insert a view inside container view.
     func add(view subView: UIView, toContainer containerView: UIView) {
        //prepare for constraints
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        //insert subview
        containerView.subviews.first?.removeFromSuperview()
        containerView.addSubview(subView)
        
        //set constraints
        subView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    func stopLoading() {
        Loading.shared.stopLoading()
    }

}
