//
//  UIImageView+Extensions.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func load(from url: String?, placeHolder: String = "noImage", tintColor: UIColor? = nil) {
        let placeHolder = UIImage(named: placeHolder)
        guard let imageUrl = url else {
            self.image = placeHolder
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: imageUrl),
                         placeholder: placeHolder,
                         options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let image):
                if let tintColor = tintColor {
                    self.tintColor = tintColor
                    self.image = image.image.withRenderingMode(.alwaysTemplate)
                }
            case .failure:
                break
            }
        }
    }
}
