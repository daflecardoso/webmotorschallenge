//
//  VehiclesCell.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

extension VehiclesViewController {
    
    class VehicleCell: BaseTableViewCell {
        
        private lazy var containerView = UIView().apply {
            $0.backgroundColor = .cardColor
        }
    
        private lazy var vehicleImageView = UIImageView().apply {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        private let makeLabel = UILabel().apply {
            $0.font = .bold(16)
        }
        
        private let modelLabel = UILabel().apply {
            $0.font = .bold(16)
            $0.textColor = .red
        }
        
        private lazy var nameStackView = UIStackView(arrangedSubviews: [
            makeLabel,
            modelLabel,
            UIView()
        ]).apply {
            $0.axis = .horizontal
            $0.spacing = 2
        }
        
        private let versionLabel = UILabel().apply {
            $0.font = .bold(14)
            $0.textColor = .lightGray
        }
        
        private let priceLabel = UILabel().apply {
            $0.font = .bold(30)
        }
        
        private lazy var stackView = UIStackView(arrangedSubviews: [
            nameStackView,
            versionLabel,
            priceLabel
        ]).apply {
            $0.axis = .vertical
            $0.spacing = 2
        }
        
        private let yearLabel = UILabel().apply {
            $0.font = .medium(12)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        
        private let kmLabel = UILabel().apply {
            $0.font = .medium(12)
            $0.textColor = .lightGray
            $0.textAlignment = .center
        }
        
        private let colorLabel = UILabel().apply {
            $0.font = .medium(12)
            $0.textColor = .lightGray
            $0.textAlignment = .right
        }
        
        private lazy var stackViewBottom = UIStackView(arrangedSubviews: [
            yearLabel,
            kmLabel,
            colorLabel
        ]).apply {
            $0.distribution = .fillEqually
            $0.axis = .horizontal
            $0.spacing = 4
        }
        
        override func setupConstraints() {
            super.setupConstraints()
            
            contentView.addSubview(containerView) {
                $0.edges.equalToSuperview()

            }
            
            containerView.addSubview(vehicleImageView) {
                $0.leading.trailing.top.equalToSuperview()
                $0.height.equalTo(200)
            }
            
            containerView.addSubview(stackView) {
                $0.leading.equalToSuperview().inset(margin)
                $0.top.equalTo(vehicleImageView.snp.bottom).offset(margin)
            }
            
            containerView.addSubview(stackViewBottom) {
                $0.leading.trailing.equalToSuperview().inset(margin)
                $0.top.equalTo(stackView.snp.bottom).offset(margin)
                $0.bottom.equalToSuperview().inset(margin)
            }
        }
        
        func set(with vehicle: Vehicle) {
            vehicleImageView.load(from: vehicle.imageUrl)
            makeLabel.text = vehicle.make
            modelLabel.text = vehicle.model
            versionLabel.text = vehicle.version
            priceLabel.text = vehicle.priceFormatted
            yearLabel.text = vehicle.yearFormatted
            kmLabel.text = vehicle.kmFormatted
            colorLabel.text = vehicle.color
        }
    }
}
