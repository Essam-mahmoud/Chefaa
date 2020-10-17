//
//  ImageHelper.swift
//  Mabiatak
//
//  Created by ahmed ezz on 8/16/19.
//

import UIKit
import Kingfisher
class SetImageWithPlaceholder{
    class func setImage(_ string: String,placeholder:String,myImage:UIImageView) {
       if let string = (string).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
          let url = URL(string: string)
          print(string)
          print(url)
          myImage.kf.indicatorType = .activity
          //                   self.studentimageView.kf.setImage(with: url)
          let processor = DownsamplingImageProcessor(size: myImage.bounds.size)
          myImage.kf.setImage(
              with: url,
              placeholder: UIImage(named: placeholder),
              options: [.processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage])
          {
              result in
              switch result {
              case .success(let value):
                  print("Task done for: \(value.source.url?.absoluteString ?? "")")
              case .failure(let error):
                  print("Job failed: \(error.localizedDescription)")
              }
          }
      }
    }
}
