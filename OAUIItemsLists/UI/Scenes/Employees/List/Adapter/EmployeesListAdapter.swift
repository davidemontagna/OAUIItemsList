//
//  EmployeesListAdapter.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation
import UIKit

class EmployeesListAdapter: NSObject {
    
    // MARK: - Properties
    
    var uiitems: [EmployeesListCellUIItem] = []
}

// MARK: - Extensions

extension EmployeesListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmployeesListCell = tableView.dequeueReusableCell(for: EmployeesListCell.self, for: indexPath)
        cell.conf(with: uiitems[indexPath.row])
        return cell
    }
}

extension EmployeesListAdapter: UITableViewDelegate {
    
}
