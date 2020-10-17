//
//  CompressionService.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import UIKit

class Compression {
    class func compress(image: UIImage, maxSize: CGFloat? = nil) -> Data? {
        guard let imageSize = image.jpegData(compressionQuality: 1)?.count else { return nil }
        let compressionRate: CGFloat
        
        if let maxSize = maxSize {
            if CGFloat(imageSize) <= (maxSize * 1024) {
                return image.jpegData(compressionQuality: 1)
            }
            
            compressionRate = (maxSize * 1024) / CGFloat(imageSize)
        } else {
            
            compressionRate = 1
        }
        
        return image.jpegData(compressionQuality: compressionRate)
    }
}
