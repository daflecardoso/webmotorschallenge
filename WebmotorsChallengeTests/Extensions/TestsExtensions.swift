//
//  TestsExtensions.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import Foundation
import UIKit

extension UITableView {
    
    func toRow(row: Int) {
        selectRow(at: IndexPath(item: row, section: 0), animated: false, scrollPosition: .bottom)
    }
}
