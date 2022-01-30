//
//  BaseTableViewCell.swift
//  iCar
//
//  Created by Dafle Cardoso on 23/07/21.
//  Copyright © 2021 Dafle Cardoso. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {
    
    internal let margin: CGFloat = Constants.margin
    internal let disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupContentView()
        setupConstraints()
    }
    
    internal func setupContentView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    internal func setupConstraints() {
        
    }
}
