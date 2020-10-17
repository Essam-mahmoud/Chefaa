//
//  BrandsCell.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/17/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class BrandsCell: UICollectionViewCell {

    @IBOutlet weak var brandImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupBrand(brand: Brands){
        let imagePath = brand.images[0]
        SetImageWithPlaceholder.setImage(Constant.mainDomain + imagePath, placeholder: "logo", myImage: brandImage)
        print(Constant.mainDomain + imagePath)
    }

}
