//
//  ItemsListCell.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import UIKit

class ItemsListCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public methods
    
    func conf(with item: ItemsListCellUIItem) {
        nameLabel.text = item.name
    }
}
