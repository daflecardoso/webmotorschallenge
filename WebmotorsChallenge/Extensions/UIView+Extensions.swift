//
//  UIView+Extensions.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

extension UIView {
    
    func setupShadow(borderColor: UIColor = UIColor.white,
                     shadowColor: UIColor = .gray,
                     radius: CGFloat = 10) {
        layer.cornerRadius = radius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.6
    }
}
