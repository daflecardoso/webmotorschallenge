//
//  VehicleDetailCells.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

extension VehicleDetailViewController {
    
    // MARK: PhotosCell
    class PhotosCell: BaseTableViewCell {
        
        private lazy var vehicleImageView = UIImageView().apply {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        override func setupConstraints() {
            super.setupConstraints()
            
            contentView.addSubview(vehicleImageView) {
                $0.leading.trailing.top.equalToSuperview()
                $0.bottom.equalToSuperview().priority(.low)
                $0.height.equalTo(200)
            }
        }
        
        func set(with photo: String?) {
            vehicleImageView.load(from: photo)
        }
    }
    
    // MARK: VehicleInfoCell
    class VehicleInfoCell: BaseTableViewCell {
        
        private let versionLabel = UILabel().apply {
            $0.font = .bold(20)
            $0.textColor = .lightGray
        }
        
        override func setupConstraints() {
            super.setupConstraints()
            
            contentView.addSubview(versionLabel) {
                $0.edges.equalToSuperview().inset(margin)
            }
        }
        
        func set(with vehicle: Vehicle) {
            versionLabel.text = vehicle.version
        }
    }
    
    // MARK: VehiclePriceCell
    class VehiclePriceCell: BaseTableViewCell {
        
        private let priceLabel = UILabel().apply {
            $0.font = .bold(30)
        }
        
        override func setupConstraints() {
            super.setupConstraints()
            
            contentView.addSubview(priceLabel) {
                $0.edges.equalToSuperview().inset(margin)
            }
        }
        
        func set(with price: String) {
            priceLabel.text = price
        }
    }
    
    // MARK: VehicleDetailCell
    class VehicleDetailCell: BaseTableViewCell {
        
        private lazy var yearLabel = makeValueLabel(.left)
        private lazy var kmLabel = makeValueLabel(.center)
        private lazy var colorLabel = makeValueLabel(.right)
        
        private func makeValueLabel(_ textAlignment: NSTextAlignment) -> UILabel {
            return UILabel().apply {
                $0.font = .semiBold(18)
                $0.textColor = .lightGray
                $0.textAlignment = textAlignment
            }
        }
        
        private lazy var stackView = UIStackView(arrangedSubviews: [
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
            contentView.addSubview(stackView) { $0.edges.equalToSuperview().inset(margin) }
        }
        
        func set(with vehicle: Vehicle) {
            yearLabel.text = vehicle.yearFormatted
            kmLabel.text = vehicle.kmFormatted
            colorLabel.text = vehicle.color
        }
    }
}
