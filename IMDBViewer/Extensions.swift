//
//  Extensions.swift
//  JerrysPlan
//
//  Created by Cong Le on 07/11/2019.
//  Copyright © 2019 Cong Le. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
	var theClassName: String {
		return NSStringFromClass(type(of: self))
	}
}

extension UIColor {
   convenience init(rgb red: Int, green: Int, blue: Int, alpha: CGFloat) {
	 self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
   }
	
	class var fontColor:UIColor {
		return .black
	}

}

extension UIImageView {
  public func maskCircle(image: UIImage) {
	self.contentMode = UIView.ContentMode.scaleAspectFill
	self.layer.cornerRadius = self.frame.height / 2
	self.layer.masksToBounds = false
	self.clipsToBounds = true

   self.image = image
  }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		layer.mask = mask
	}
}

