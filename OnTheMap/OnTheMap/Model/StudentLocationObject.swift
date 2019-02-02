//
//  StudentLocationObject.swift
//  OnTheMap
//
//  Created by samar on 08/05/1440 AH.
//  Copyright © 1440 udacity. All rights reserved.
//

import Foundation
struct StudentLocationObject: Codable {
    var createdAt: String?
    var latitude: Double?
    var longitude: Double?
    var objectId: String?
    var uniqueKey: String?
    var firstName: String?
    var lastName: String?
    var mapString: String?
    var mediaURL: String?
    var updatedAt: String?
}

extension StudentLocationObject {
    init(mapString: String, mediaURL: String) {
        self.mapString = mapString
        self.mediaURL = mediaURL
    }
}

enum Param: String {
    case createdAt
    case firstName
    case lastName
    case latitude
    case longitude
    case mapString
    case mediaURL
    case objectId
    case uniqueKey
    case updatedAt
    
}
