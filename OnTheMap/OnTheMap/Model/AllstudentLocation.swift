//
//  AllstudentLocation.swift
//  OnTheMap
//
//  Created by samar on 08/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
struct  AllstudentLocation {
    var stLocation: [StudentLocationObject] = []
}

func sharedInstance() -> AllstudentLocation {
    struct Singleton {
        static var sharedInstance = AllstudentLocation()
    }
    
    return Singleton.sharedInstance
}


