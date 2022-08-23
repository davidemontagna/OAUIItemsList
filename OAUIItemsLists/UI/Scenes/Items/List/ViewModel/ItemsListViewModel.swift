//
//  ItemsListViewModel.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation
import Alamofire

protocol ItemsListViewModelDelegate: AnyObject {
    func onSuccess(_ type: ItemsListViewModelUseCases)
    func onFailure(error: String)
}

class ItemsListViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: ItemsListViewModelDelegate?
    
    // MARK: - Properties
    
    var itemsResponse: [Item] = []
    var uiitems: [ItemsListCellUIItem] {
        return itemsResponse.map { i in
            return ItemsListCellUIItem(name: i.name)
        }
    }
    
    // MARK: - ViewModel Lifecycle
    
    init(delegate: ItemsListViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func getItems() {
        AF.request("https://over-inventory.azurewebsites.net/api/Devices").responseDecodable(of: ItemsResponse.self) { response in
            switch response.result {
            case .failure(let error):
                self.delegate?.onFailure(error: error.localizedDescription)
            case .success(let response):
                self.itemsResponse = response
                self.delegate?.onSuccess(.getItems)
            }
        }
    }
}
