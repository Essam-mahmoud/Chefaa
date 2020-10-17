//
//  Storyboard.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import Foundation

enum Storyboard: String {
    case Main
    case Booking
    case Service
    case Employee
    case Category
    case BusinessProfile
    case AccountSetting
    case Offers
    case Packages
}

extension Storyboard: Name {
    var name: String {
        return self.rawValue
    }
}
