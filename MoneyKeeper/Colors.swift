//
//  Colors.swift
//  MoneyKeeper
//
//  Created by Dung on 7/10/17.
//  Copyright © 2017 Dung. All rights reserved.
//
import Foundation
import UIKit
class Colors {
       static let mainColorApp = UIColor(red: 36, green: 138, blue: 98)
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
