//
//  UIViewController.swift
//  HipoLabs
//
//  Created by bahadir on 6.04.2021.
//


import UIKit

extension UIViewController {
    
    enum Storyboards:String {
        case main = "Main"
        case login
    }
    
    static func instantiateViewController(with identifier: String) -> Self {
        
        let storyboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return viewController
    }
    
}
