//
//  FindLocationViewController.swift
//  OnTheMap
//
//  Created by samar on 12/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class FindLocationViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var navBar: UINavigationBar!
    
  
    
    var link: String!
    var location: String!
    var pointAnnotation: MKPointAnnotation!
    var lat: Double!
    var long: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureActivityIndicator()
        self.startLocationSearch()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Add Location"
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func configureActivityIndicator() {
        
        startAnActivityIndicator().hidesWhenStopped = true
        
        view.addSubview(startAnActivityIndicator())
        startAnActivityIndicator().translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: startAnActivityIndicator, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        view.addConstraint(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: startAnActivityIndicator, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        view.addConstraint(verticalConstraint)
    }
    
    private func startLocationSearch() {
        self.startAnActivityIndicator().startAnimating()
        let localSearchRequest = MKLocalSearch.Request()
        localSearchRequest.naturalLanguageQuery = self.location
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                AlertController.sharedInstance().displayAlertView(viewController: self, errorString: "Place Not Found")
                self.startAnActivityIndicator().stopAnimating()
                return
            }
            
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = self.location
            
            self.lat = localSearchResponse!.boundingRegion.center.latitude
            self.long = localSearchResponse!.boundingRegion.center.longitude
            
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.lat, longitude: self.long)
            
            self.pointAnnotation.coordinate = coordinate
            let pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            
            self.map.centerCoordinate = self.pointAnnotation.coordinate
            self.map.addAnnotation(pinAnnotationView.annotation!)
            
            // Init the zoom level
            let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 80)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            self.map.setRegion(region, animated: true)
            self.startAnActivityIndicator().stopAnimating()
            
        }
    }
    
    
    @IBAction func Finish(_ sender: Any) {
        
        self.startAnActivityIndicator().startAnimating()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userData = appDelegate.userData!
        
        if (pointAnnotation) != nil {
            
          // i want help here
         
            }
            
        }
    }

