//
//  BestSellingCell.swift
//  ChefaaTask
//
//  Created by Smart Zone on 10/17/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit

class BestSellingCell: UICollectionViewCell {

    @IBOutlet weak var offerLable: UILabel!
    @IBOutlet weak var offerImage: UIImageView!
    @IBOutlet weak var offerDescription: UILabel!
    @IBOutlet weak var priceAfter: UILabel!
    @IBOutlet weak var priceBefore: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupSelling(sell: Bestselling){
        offerLable.text = sell.coupon_description
        SetImageWithPlaceholder.setImage(Constant.mainDomain + sell.images[0], placeholder: "logo", myImage: offerImage)
        offerDescription.text = sell.title
        priceAfter.text = "\(sell.final_discount)" + "EGP"
        priceBefore.text = "\(sell.price)" + "EGP"
    }

    @IBAction func addToCardBtn(_ sender: UIButton) {
    }
}
