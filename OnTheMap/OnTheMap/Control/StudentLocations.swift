//
//  Studentlocation.swift
//  OnTheMap
//
//  Created by samar on 10/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation


class StudentLocations {
    var locations: [StudentLocation] = [StudentLocation]()
    
    class func sharedInstance() -> StudentLocations {
        struct Singleton {
            static var sharedInstance = StudentLocations()
        }
        
        return Singleton.sharedInstance
    }
}
