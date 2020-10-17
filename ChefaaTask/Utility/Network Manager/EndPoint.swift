//
//  EndPoint.swift
//  glamera
//
//  Created by Kerolos Fahem on 13/02/19.
//  Copyright © 2018 Kerolos Fahem. All rights reserved.
//


import Foundation

struct Endpoint {
    
    enum user {
        case homeData
    }
    
}
extension Endpoint.user {
    var path: String {
        var endpoint = ""
        
        switch self {
            
        case .homeData: endpoint = "api/store/home-page"
        }
        
        return endpoint
    }
}




