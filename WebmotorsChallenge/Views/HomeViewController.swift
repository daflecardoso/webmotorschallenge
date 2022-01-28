//
//  HomeViewController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    private let cells = [
        VehicleCell.self,
    ]
    
    private lazy var tableView = UITableView().apply {
        $0.register(cellTypes: cells)
        $0.separatorStyle = .none
        $0.refreshControl = refreshControl
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let refreshControl = UIRefreshControl()
    
    override var baseViewModel: BaseViewModel? { viewModel }
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
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
        setupBinds()
    }
    
    private func setupView() {
        self.title = "Veículos"
    }
    
    private func setupConstraints() {
        view.addSubview(tableView) {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupBinds() {
        viewModel
            .reload
            .drive(onNext: { [unowned self] in
                tableView.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: VehicleCell.self, for: indexPath)
        let item = viewModel.items[indexPath.row]
        cell.set(with: item)
        return cell
    }
}

extension HomeViewController {
    
    private class VehicleCell: BaseTableViewCell {
        
        private lazy var containerView = UIView().apply {
            $0.backgroundColor = .white
        }
        
        private lazy var childContainer = UIView().apply {
            $0.backgroundColor = .white
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
        
        private lazy var vehicleImageView = UIImageView().apply {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
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
        
        private let priceLabel = UILabel().apply {
            $0.font = .boldSystemFont(ofSize: 22)
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
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
            $0.textAlignment = .left
        }
        
        private let kmLabel = UILabel().apply {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
            $0.textAlignment = .center
        }
        
        private let colorLabel = UILabel().apply {
            $0.font = .systemFont(ofSize: 12)
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
                $0.leading.trailing.top.equalToSuperview().inset(margin)
                $0.bottom.equalToSuperview()
            }
            
            containerView.addSubview(childContainer) {
                $0.edges.equalToSuperview()
            }
            
            childContainer.addSubview(vehicleImageView) {
                $0.leading.trailing.top.equalToSuperview()
                $0.height.equalTo(200)
            }
            
            childContainer.addSubview(stackView) {
                $0.leading.equalToSuperview().inset(margin)
                $0.top.equalTo(vehicleImageView.snp.bottom).offset(margin)
            }
            
            childContainer.addSubview(stackViewBottom) {
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
            containerView.setupShadow()
        }
    }
}
