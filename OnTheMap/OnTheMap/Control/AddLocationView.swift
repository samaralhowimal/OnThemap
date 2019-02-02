//
//  AddLocationViewController.swift
//  OnTheMap
//
//  Created by samar on 12/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import UIKit
import CoreLocation

class AddLocationView: UIViewController {
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var linkField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addLocation(_ sender: Any) {
        guard let location = locationField.text,
            let link = linkField.text,
            location != "", link != "" else {
                self.showErr(title: "Error", message: "Location field and link field are mandetory")
                return
        }
        let studentLocation = StudentLocationObject(mapString: location, mediaURL: link)
        geocodeCoordinates(studentLocation)
    }
    
    private func geocodeCoordinates(_ studentLocation: StudentLocationObject) {
        
        let spinner = self.ActivityIndicator()
        CLGeocoder().geocodeAddressString(studentLocation.mapString!) { (placeMarks, err) in
            spinner.stopAnimating()
            
            guard let firstLocation = placeMarks?.first?.location else {
                self.showErr(title: "Error", message: "Couldn't find location")
                return
            }
            
            var location = studentLocation
            location.latitude = firstLocation.coordinate.latitude
            location.longitude = firstLocation.coordinate.longitude
            
            self.performSegue(withIdentifier: "findLocation", sender: location)
        }
        
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func ActivityIndicator() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .gray)
        self.view.addSubview(spinner)
        self.view.bringSubviewToFront(spinner)
        spinner.center = self.view.center
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findLocation", let vc = segue.destination as? LocationInfoView {
            vc.location = (sender as! StudentLocationObject)
        }
    }
    
    
    
}
