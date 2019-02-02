//
//  LocationInfo.swift
//  OnTheMap
//
//  Created by samar on 15/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationInfoView: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var location: StudentLocationObject?
    
    private var reusePinID = "pin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeMap()
    }
    
    private func initializeMap() {
        print(location ?? "null")
        guard let location = location else { return }
        
        let lat = CLLocationDegrees(location.latitude!)
        let long = CLLocationDegrees(location.longitude!)
        
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = location.mapString
        
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reusePinID) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reusePinID)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let link = view.annotation?.subtitle!,
                let url = URL(string: link), app.canOpenURL(url) {
                app.open(url, options: [:], completionHandler: nil)
            } else {
                showErr(title: "Error", message: "Cann't open URL link")
            }
        }
    }
    
    @IBAction func Finish(_ sender: Any) {
        APINetwork.postLocations(self.location!) { err  in
            guard err == nil else {
                self.showErr(title: "Error", message: err!)
                return
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
