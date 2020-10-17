//
//  UITableViewExtension.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func validate(indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        
        if indexPath.row >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        
        return true
    }
    
}

