//
//  VehicleDetailViewController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class VechicleDetailViewController: BaseViewController {
    
    private let cells = [
        PhotosCell.self,
        VehicleInfoCell.self,
        VehiclePriceCell.self,
        VehicleDetailCell.self
    ]
    
    private lazy var tableView = UITableView().apply {
        $0.register(cellTypes: cells)
        $0.separatorInset = .zero
        $0.delegate = self
        $0.dataSource = self
    }
    
    override var baseViewModel: BaseViewModel? { viewModel }
    private let viewModel: VehicleDetailViewModel
    
    init(viewModel: VehicleDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        viewModel.fetch()
    }
    
    private func setup() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        title = viewModel.vehicle.model
    }
    
    private func setupConstraints() {
        view.addSubview(tableView) { $0.edges.equalToSuperview() }
    }
}

extension VechicleDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        switch item {
        case .photos(let photo):
            let cell = tableView.dequeueReusableCell(with: PhotosCell.self, for: indexPath)
            cell.set(with: photo)
            return cell
        case .vehicle(let vehicle):
            let cell = tableView.dequeueReusableCell(with: VehicleInfoCell.self, for: indexPath)
            cell.set(with: vehicle)
            return cell
        case .price(let price):
            let cell = tableView.dequeueReusableCell(with: VehiclePriceCell.self, for: indexPath)
            cell.set(with: price)
            return cell
        case .detail(let vehicle):
            let cell = tableView.dequeueReusableCell(with: VehicleDetailCell.self, for: indexPath)
            cell.set(with: vehicle)
            return cell
        }
    }
}
