//
//  UIImageViewExtention.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageWithUrlString(urlStr:String) {
        let url = URL(string: urlStr.vaildStringUrl())
        self.kf.setImage(with: url)
    }
    
    func setImageWithUrlString(urlStr: String, placholder: String? = "") {
        let url = URL(string: urlStr.vaildStringUrl())
        self.kf.setImage(with: url, placeholder: UIImage(named: placholder ?? ""), options: nil, progressBlock: nil) { (image, error, cash, url) in
            
        }
    }
        
    func loadImageFromUrl (imgUrl : String?){
        let defualtImage = UIImage(named: "default_image")
        if imgUrl == "" || imgUrl == nil {
            self.image = defualtImage
            return
        }
        
        let encoding : String = imgUrl?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: encoding ) else {
            self.image = defualtImage
            return
        }
        self.kf.setImage(with: url,placeholder: defualtImage)
    }
    func makeRounded() {

        //self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        //self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 4
        self.clipsToBounds = true
    }
    
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return self.jpegData(compressionQuality: quality.rawValue)
    }
}
