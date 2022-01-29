//
//  VehicleDetailCells.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

extension VechicleDetailViewController {
    
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
        
        func set(with photo: String) {
            vehicleImageView.load(from: photo)
        }
    }
    
    // MARK: VehicleInfoCell
    class VehicleInfoCell: BaseTableViewCell {
        
        private let makeLabel = UILabel().apply {
            $0.font = .boldSystemFont(ofSize: 16)
        }
        
        private let modelLabel = UILabel().apply {
            $0.font = .boldSystemFont(ofSize: 16)
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
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .lightGray
        }
        
        private lazy var stackView = UIStackView(arrangedSubviews: [
            nameStackView,
            versionLabel
        ]).apply {
            $0.axis = .vertical
            $0.spacing = 2
        }
        
        override func setupConstraints() {
            super.setupConstraints()
            
            contentView.addSubview(stackView) {
                $0.edges.equalToSuperview().inset(margin)
            }
        }
        
        func set(with vehicle: Vehicle) {
            makeLabel.text = vehicle.make
            modelLabel.text = vehicle.model
            versionLabel.text = vehicle.version
        }
    }
    
    // MARK: VehiclePriceCell
    class VehiclePriceCell: BaseTableViewCell {
        
        private let priceLabel = UILabel().apply {
            $0.font = .boldSystemFont(ofSize: 22)
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
        
        private lazy var yearLabel = makeValueLabel()
        private lazy var kmLabel = makeValueLabel()
        private lazy var colorLabel = makeValueLabel()
        
        private func makeValueLabel() -> UILabel {
            return UILabel().apply {
                $0.font = .systemFont(ofSize: 16)
                $0.textColor = .lightGray
            }
        }
        
        private lazy var stackView = UIStackView(arrangedSubviews: [
            yearLabel,
            kmLabel,
            colorLabel
        ]).apply {
            $0.axis = .vertical
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
