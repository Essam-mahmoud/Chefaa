//
//  NewOffersCell.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/17/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class NewOffersCell: UICollectionViewCell {

    @IBOutlet weak var offerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupOffer(page: LandingPages){
        
        SetImageWithPlaceholder.setImage(Constant.mainDomain + page.image, placeholder: "logo", myImage: offerImage)
        offerImage.makeRounded()
    }

}
