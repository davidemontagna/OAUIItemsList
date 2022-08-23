//
//  ItemsListViewController.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import UIKit

class ItemsListViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Adapter
    
    lazy var adapter = ItemsListAdapter()
    
    // MARK: - ViewModel
    
    lazy var viewModel = ItemsListViewModel(delegate: self)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: ItemsListCell.self)
        // Setup tableView
        tableView.delegate = adapter
        tableView.dataSource = adapter
        viewModel.getItems()
    }
}

// MARK: - Extensions

extension ItemsListViewController: ItemsListViewModelDelegate {
    func onSuccess(_ type: ItemsListViewModelUseCases) {
        switch type {
        case .getItems:
            adapter.uiitems = viewModel.uiitems
            tableView.reloadData()
        }
    }
    
    func onFailure(error: String) {
        let alert = UIAlertController(title: "Si è verificato un errore",
                                      message: error,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: { (action: UIAlertAction!) in
            
        }))
        present(alert, animated: true, completion: nil)
    }
}
