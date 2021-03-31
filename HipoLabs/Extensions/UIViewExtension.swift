//
//  UIViewExtension.swift
//  HipoLabs
//
//  Created by bahadir on 27.03.2021.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = newValue
        }
    }
        var kTagActivityIndicatorView:Int{ 13934}
        
        func startActivityIndicator(style: UIActivityIndicatorView.Style = .medium) {
            
            let activity = UIActivityIndicatorView(style: style)
            superview?.layoutIfNeeded()
            activity.frame = CGRect(origin: self.center, size: CGSize(width: activity.bounds.size.width, height: activity.bounds.size.height))
            activity.tag = kTagActivityIndicatorView
            activity.hidesWhenStopped = true
            activity.startAnimating()
            self.addSubview(activity)
        }
        
        func stopActivityIndicator() {
            
            if let activity = self.viewWithTag(kTagActivityIndicatorView) {
                activity.removeFromSuperview()
            }
        }
    
}


