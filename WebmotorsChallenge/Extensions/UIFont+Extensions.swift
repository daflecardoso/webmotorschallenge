//
//  UIFont+Extensions.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 29/01/22.
//

import Foundation
import UIKit

public extension UIFont {
    
    class func fontBy(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func regular(_ size: CGFloat) -> UIFont {
        return self.fontBy(name: "Rajdhani-Regular", size: size)
    }
    
    class func medium(_ size: CGFloat) -> UIFont {
        return self.fontBy(name: "Rajdhani-Medium", size: size)
    }
    
    class func bold(_ size: CGFloat) -> UIFont {
        return self.fontBy(name: "Rajdhani-Bold", size: size)
    }
    
    class func semiBold(_ size: CGFloat) -> UIFont {
        return self.fontBy(name: "Rajdhani-SemiBold", size: size)
    }
    
    class func light(_ size: CGFloat) -> UIFont {
        return self.fontBy(name: "Rajdhani-Light", size: size)
    }
}
