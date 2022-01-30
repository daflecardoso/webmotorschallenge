//
//  TableLoadingFooterView.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class TableLoadingFooterView: UIView {
    
    private let indicator = UIActivityIndicatorView(style: .white).apply {
        $0.startAnimating()
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.color = .wb
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(indicator) { $0.centerX.centerY.equalToSuperview() }
    }
}
