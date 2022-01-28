//
//  DefaultNavigationController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class DefaultNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .backgroundContainerViews
            navigationBar.tintColor = .wb
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            navigationBar.setBackgroundImage(UIImage(), for: .default)
        } else {
            navigationBar.tintColor = .wb
            navigationBar.barTintColor = .backgroundContainerViews
            navigationBar.shadowImage = UIImage()
            navigationBar.setBackgroundImage(UIImage(), for: .default)
        }
    }
}
