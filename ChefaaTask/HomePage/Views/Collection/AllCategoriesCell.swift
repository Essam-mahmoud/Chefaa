//
//  AllCategoriesCell.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/17/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class AllCategoriesCell: UICollectionViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCat(cat: SubCategories){
        SetImageWithPlaceholder.setImage(Constant.mainDomain + cat.image, placeholder: "logo", myImage: catImage)
        catName.text = cat.title
    }

}
