//
//  UILabel+Extensions.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 29/01/22.
//

import Foundation
import UIKit

extension UILabel {
    
    class func title(_ title: String) -> UILabel {
        return UILabel().apply { label in
            label.text = title
            label.font = .bold(18)
        }
    }
    
    class func title(_ make: String?, _ model: String?) -> UIStackView {
        return UIStackView(arrangedSubviews: [
            UILabel().apply {
                $0.font = .bold(20)
                $0.text = make
            },
            UILabel().apply {
                $0.font = .bold(20)
                $0.textColor = .red
                $0.text = model
            }
        ]).apply {
            $0.axis = .horizontal
            $0.spacing = 2
        }
    }
}
