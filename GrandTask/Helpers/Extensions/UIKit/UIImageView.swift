//
//  UIImageView.swift
//  GrandTask
//
//  Created by host on 27/12/2022.
//

import Foundation
import SDWebImage
import UIKit
extension UIImageView {
    func setImage(url: String? = "") {
        if let urlString = url, let url = URL(string: urlString) {
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_imageIndicator?.startAnimatingIndicator()
            sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), options: .refreshCached)
        } else {
            image = UIImage(named: "placeholder")
        }
    }
}



extension UIView {
    @IBInspectable
    var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var border: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
 
 
    
  
    
    func showSpinner(backgroundColor: UIColor? = nil, spinnerColor: UIColor = .white) {
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.corner = self.corner
        spinnerView.clipsToBounds =  true
        spinnerView.backgroundColor = backgroundColor == nil ? self.backgroundColor : backgroundColor
        let indecator = UIActivityIndicatorView.customIndicator(at: spinnerView.center)
        indecator.backgroundColor = UIColor.clear
        indecator.indicatorColor = spinnerColor
        indecator.startAnimating()
        indecator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indecator)
            self.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
}




extension UIActivityIndicatorView {
    public var indicatorColor: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    
    public var indicatorBackgroundColor: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    
    public static func customIndicator(at center: CGPoint) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 50, height: 50))
        indicator.layer.cornerRadius = 10
        indicator.center = center
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = indicator.indicatorColor
        indicator.backgroundColor = indicator.indicatorBackgroundColor
        return indicator
    }
}
import QuartzCore

class Loading{
    static var shared: Loading = Loading()
    
    private init() {}
    
    func startLoading(on view: UIView, backgroundColor: UIColor = .white) {
        DispatchQueue.main.async {
            LoadingView.shared.startLoading(on: view, backgroundColor: backgroundColor)
        }
    }
    
    func smallLoading(on view: UIView) {
        DispatchQueue.main.async {
            LoadingView.shared.smallLoading(on: view)
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            LoadingView.shared.stopLoading()
        }
    }
}


extension Loading {
    class LoadingView {
        static var shared = LoadingView()
        
        private var loadingView: UIView
//        private var animateView: AnimationView
        private var activityIndicator: UIActivityIndicatorView
        
        private init() {
            loadingView = UIView()
            
//            animateView = AnimationView.init(name: "loading")
//            animateView.animationSpeed = 1.5
//            animateView.loopMode = .loop
//            animateView.contentMode = .scaleAspectFit
            
            activityIndicator = UIActivityIndicatorView()
        }
        
        func startLoading(on view: UIView, backgroundColor: UIColor = .white){
            loadingView.backgroundColor = backgroundColor
            loadingView.frame = view.frame
            
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(loadingView)
            loadingView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
            loadingView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
            
//            animateView.translatesAutoresizingMaskIntoConstraints = false
//            loadingView.addSubview(animateView)
//            animateView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
//            animateView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//            animateView.heightAnchor.constraint(equalTo: loadingView.heightAnchor, multiplier: 0.5).isActive = true
//            animateView.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.5).isActive = true
            
//            animateView.play()
        }
        
        func smallLoading(on view: UIView){
            loadingView.frame = view.frame
            loadingView.backgroundColor = .white
            
            activityIndicator.color = .gray
            activityIndicator.startAnimating()
            
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(loadingView)
            loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            loadingView.addSubview(activityIndicator)
            activityIndicator.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1).isActive = true
            activityIndicator.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 1).isActive = true
        }
        
        func stopLoading(){
            loadingView.removeFromSuperview()
            activityIndicator.removeFromSuperview()
//            animateView.removeFromSuperview()
            activityIndicator.stopAnimating()
//            animateView.stop()
        }
    }
}
