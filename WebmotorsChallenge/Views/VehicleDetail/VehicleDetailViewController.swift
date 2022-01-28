//
//  VehicleDetailViewController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class VechicleDetailViewController: BaseViewController {
    
    private lazy var tableView = UITableView().apply {
        //$0.register(cellTypes: cells)
        $0.separatorStyle = .none
        //$0.refreshControl = refreshControl
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
        
        title = "Test"
        
        view.addSubview(tableView) { $0.edges.equalToSuperview() }
    }
}

extension VechicleDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
