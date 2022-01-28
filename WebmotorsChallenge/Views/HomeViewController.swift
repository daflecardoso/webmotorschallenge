//
//  HomeViewController.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    override var baseViewModel: BaseViewModel? { viewModel }
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch()
        view.backgroundColor = .red
    }
}
