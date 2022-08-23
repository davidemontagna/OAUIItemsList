//
//  ItemsListAdapter.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation
import UIKit

class ItemsListAdapter: NSObject {
    
    // MARK: - Properties
    
    var uiitems: [ItemsListCellUIItem] = []
}

// MARK: - Extensions

extension ItemsListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemsListCell = tableView.dequeueReusableCell(for: ItemsListCell.self, for: indexPath)
        cell.conf(item: uiitems[indexPath.row])
        return cell
    }
}

extension ItemsListAdapter: UITableViewDelegate {
    
}
