//
//  TotalVehiclesView.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 31/01/22.
//

import Foundation
import UIKit

class TotalVehiclesView: UIView {
    
    lazy var totalLabel = UILabel().apply {
        $0.textColor = .white
        $0.font = .bold(16)
    }
    var radius: CGFloat = 20
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .red
    }
    
    private func setupConstraints() {
        addSubview(totalLabel) {
            $0.edges.equalToSuperview().inset(8)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .bottomLeft], radius: radius)
    }
}
