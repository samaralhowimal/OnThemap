//
//  TableViewController.swift
//  OnTheMap
//
//  Created by samar on 10/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//
import Foundation
import UIKit

class TableViewController: ShareController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var locaList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var locationsInfo: AllstudentLocation? {
        didSet {
            guard let locationsInfo = locationsInfo else { return }
            locations = locationsInfo.stLocation
        }
    }
    var locations: [StudentLocationObject] = [] {
        didSet {
            locaList.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentLocationCell", for: indexPath) as! TableCellView
        
        cell.locationData = locations[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let mediaURL = locations[indexPath.row].mediaURL,
            let url = URL(string: mediaURL),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            showErr(title: "Error", message: "Link couldn't be opened")
        }
    }
    
}
