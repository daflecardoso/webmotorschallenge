//
//  VehiclesViewController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class VehiclesViewController: BaseViewController {
    
    private let cells = [
        VehicleCell.self
    ]
    
    lazy var tableView = UITableView().apply {
        $0.register(cellTypes: cells)
        $0.separatorInset = .zero
        $0.refreshControl = refreshControl
        $0.delegate = self
        $0.dataSource = self
        $0.tableFooterView = footerView
    }
    
    private let refreshControl = UIRefreshControl()
    
    private let footerView = TableLoadingFooterView()
    
    override var baseViewModel: BaseViewModel? { viewModel }
    private let viewModel: VehiclesViewModel
    
    init(viewModel: VehiclesViewModel) {
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
        navigationItem.titleView = UIImageView.logo()
    }
    
    private func setupConstraints() {
        view.addSubview(tableView) { $0.edges.equalToSuperview() }
    }
    
    private func setupBinds() {
        
        refreshControl
            .rx
            .controlEvent(.valueChanged)
            .subscribe(onNext: { [unowned self] in
                viewModel.refresh()
            }).disposed(by: disposeBag)
        
        viewModel
            .reload
            .drive(onNext: { [unowned self] in
                refreshControl.endRefreshing()
                hud.isHidden = true
                tableView.reloadData()
            }).disposed(by: disposeBag)
        
        baseViewModel?
            .onError
            .drive(onNext: { [unowned self] _ in
                self.refreshControl.endRefreshing()
            }).disposed(by: disposeBag)
        
        baseViewModel?
            .paginating
            .map {!$0 }
            .drive(footerView.rx.isHidden)
            .disposed(by: disposeBag)
    }
}

extension VehiclesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items[indexPath.row]
        push(coordinator.makeVechicleDetailViewController(vehicle: item))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(with: VehicleCell.self, for: indexPath).apply {
            $0.set(with: viewModel.items[indexPath.row])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        viewModel.paginate(
            offsetY: scrollView.contentOffset.y + scrollView.frame.size.height,
            contentSizeHeight: scrollView.contentSize.height - 200
        )
    }
}
