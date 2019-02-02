//
//  MapViewController.swift
//  OnTheMap
//
//  Created by samar on 11/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: ShareController, MKMapViewDelegate {
    
   
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var reusePinID = "pin"
    
    override var locationsInfo: AllstudentLocation? {
        didSet {
            loadLocations()
        }
    }
    
    func loadLocations() {
        guard let locations = locationsInfo?.stLocation
            else { return }
        
        var annotations = [MKPointAnnotation]()
        
        for location in locations {
            
            guard let latitude = location.latitude, let longitude = location.longitude else { continue }
            let lat = CLLocationDegrees(latitude)
            let long = CLLocationDegrees(longitude)
            
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            
            let first = location.firstName
            let last = location.lastName
            let mediaURL = location.mediaURL
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "\(first ?? "") \(last ?? "")"
            annotation.subtitle = mediaURL
            
            annotations.append(annotation)
        }
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
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
                showErr(title: "Error", message: " The Link can't open")
            }
        }
        
        
    }
}
