//
//  UIViewExtension.swift
//  glamera
//
//  Created by Smart Zone on 12/23/19.
//  Copyright © 2019 Kerolos Rateeb. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorner(corners: UIRectCorner, radius: CGFloat) {
        let bounds = UIScreen.main.bounds
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: UIScreen.main.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    func shadow( shadowOpacity: Float? = 0.3, shadowRadius: CGFloat? = 20 , shadowOffset: CGSize? = CGSize(width: 3, height: 3), color: CGColor? = UIColor.gray.cgColor.copy(alpha: 0.3)) {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 25)
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = shadowOffset ?? CGSize.zero
        self.layer.shadowOpacity = shadowOpacity ?? 0.3
        //self.layer.shadowRadius = shadowRadius ?? 20
        self.layer.shadowPath = shadowPath.cgPath
    }

    func setBorder( color: CGColor? = UIColor.lightGray.cgColor.copy(alpha: 0.5), width: CGFloat? = 0.5) {
        self.layer.borderColor = color ?? UIColor.lightGray.cgColor.copy(alpha: 0.5)
        self.layer.borderWidth = width ?? 0.5
    }

    func cornerRadiusView( radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func cornerRadiusForHeight() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    func addPlaceholder(placeholder: UILabel,text: String,size: CGFloat) {
        placeholder.text = text
        
        placeholder.textAlignment = .right
//        placeholder.center = self.center
        placeholder.backgroundColor = UIColor.clear
        placeholder.textColor = .lightGray
        placeholder.sizeToFit()
        placeholder.font = UIFont.systemFont(ofSize: size)
        self.addSubview(placeholder)
    }
    
    
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
    
    func roundCornersTop(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundCornersBottom(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func removeCornersTop(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }

    func removeCornersBottom(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    /// [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    func setCornerforTop( withShadow: Bool? = false, cornerMask: CACornerMask? = [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: CGFloat? = 20) {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = radius ?? 10
        if withShadow ?? false {
            self.shadow()
        }
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = cornerMask ?? [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    /// [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    func setCornerforBottom( withShadow: Bool? = false, cornerMask: CACornerMask? = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: CGFloat? = 10) {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = radius ?? 10
        if withShadow ?? false {
            self.shadow()
        }
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = cornerMask ?? [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }

    
    // MARK :- Maps
    func lock() {
        if let _ = viewWithTag(10) {
            //View is already locked
        }
        else {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            lockView.tag = 10
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(style: .white)
            activity.hidesWhenStopped = true
            activity.center = lockView.center
            lockView.addSubview(activity)
            activity.startAnimating()
            addSubview(lockView)
            
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 1.0
            })
        }
    }
    
    func unlock() {
        if let lockView = viewWithTag(10) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }, completion: { finished in
                lockView.removeFromSuperview()
            })
        }
    }
    
    func fadeOut(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func fadeIn(_ duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    class func viewFromNibName(_ name: String) -> UIView? {
        let views = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        return views?.first as? UIView
    }
    
    enum Line_Position {
        case top
        case bottom
    }
    
    func addLine(position : Line_Position, color: UIColor, height: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)
        
        let metrics = ["width" : NSNumber(value: height)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
        
        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}
