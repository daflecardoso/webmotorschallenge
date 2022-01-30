//
//  UIApplicationExtensions.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 30/01/22.
//

import Foundation
import UIKit

extension UIApplication {
    
    static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .first(where: { $0 is UIWindowScene })
                .flatMap({ $0 as? UIWindowScene })?.windows
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        }
    }
}
