//
//  TableCellView.swift
//  OnTheMap
//
//  Created by samar on 15/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//


import Foundation
import UIKit

class TableCellView: UITableViewCell {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Link: UILabel!
    
    var locationData:StudentLocationObject? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        Name.text = "\(locationData?.firstName ?? " ") \(locationData?.lastName ?? " ")"
        Link.text = "\(locationData?.mediaURL ?? " ")"
    }
    
}
