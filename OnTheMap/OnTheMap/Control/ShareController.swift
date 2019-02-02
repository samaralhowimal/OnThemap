//
//  ShareController.swift
//  OnTheMap
//
//  Created by samar on 10/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation

import UIKit

class ShareController: UIViewController {
    
    var locationsInfo: AllstudentLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadLocations()
    }
    
    func setupUI() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addLocation(_:)))
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout(_:)))
        
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = logoutButton
        navigationItem.title = "On the Map"
    }
    
    @objc private func addLocation(_ sender: Any) {
        let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "findLocation") as! UINavigationController
        
        present(navController, animated: true, completion: nil)
    }
    
    
    private func loadLocations() {
        APINetwork.getStudentInfo { (data) in
            guard let data = data else {
                self.showErr(title: "Error", message: "An error occured while reading locations")
                return
            }
            guard data.stLocation.count > 0 else {
                self.showErr(title: "Error", message: "No location found")
                return
            }
            self.locationsInfo = data
        }
    }
    
    @objc private func logout(_ sender: Any) {
        APINetwork.delete() { err  in
            guard err == nil else {
                self.showErr(title: "Error", message: err!)
                return
            }
            
            let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage")
            
            self.present(navController, animated: true, completion: nil)
        }
    }
    
}

 
