//
//  FormattableNumberic.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation

protocol FormattableNumeric {
    
}

extension Int: FormattableNumeric {}
extension UInt: FormattableNumeric {}
extension Float: FormattableNumeric {}
extension Double: FormattableNumeric {}
extension NSNumber: FormattableNumeric {}

extension FormattableNumeric {
    
    func toDecimalCoin() -> String {
        let value = Double(truncating: self as? NSNumber ?? 0)
        let divider = Double(100)
        let result = value / divider
        return result.toCoin()
    }
    
    func toCoin(with locale: Locale = Locale(identifier: "pt_BR")) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = locale
        numberFormatter.alwaysShowsDecimalSeparator = true
        return numberFormatter.string(for: self)!
    }
    
    func toNumber(with locale: Locale = Locale(identifier: "pt_BR")) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.alwaysShowsDecimalSeparator = false
        numberFormatter.locale = locale
        return numberFormatter.string(for: self)!
    }
}
