//
//  UIColor+Hex.swift
//  HW21
//
//  Created by Artem Mazurkevich on 01.06.2022.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor{
        return UIColor(
            red: CGFloat.random(in: 0...255) / 255.0,
            green: CGFloat.random(in: 0...255) / 255.0,
            blue: CGFloat.random(in: 0...255) / 255.0,
            alpha: 1.0)
    }
    
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}
