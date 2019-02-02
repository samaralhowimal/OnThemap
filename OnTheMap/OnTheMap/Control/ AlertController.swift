//
//   AlertController.swift
//  OnTheMap
//
//  Created by samar on 12/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//


import Foundation
import UIKit

class AlertController: NSObject {
    
    override init() {
        super.init()
    }
    
    func displayAlertView(viewController: UIViewController, errorString: String) {
        let alert = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    class func sharedInstance() -> AlertController {
        struct Singleton {
            static var sharedInstance = AlertController()
        }
        
        return Singleton.sharedInstance
    }
}
