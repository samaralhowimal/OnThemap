//
//  interfaceViewController.swift
//  OnTheMap
//
//  Created by samar on 08/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErr(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

