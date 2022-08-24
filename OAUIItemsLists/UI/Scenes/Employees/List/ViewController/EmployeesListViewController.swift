//
//  EmployeesListViewController.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import UIKit

class EmployeesListViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Adapter
    
    lazy var adapter = EmployeesListAdapter(delegate: self)
    
    // MARK: - ViewModel
    
    lazy var viewModel = EmployeesListViewModel(delegate: self)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: EmployeesListCell.self)
        // Setup tableView
        tableView.delegate = adapter
        tableView.dataSource = adapter
        viewModel.getEmployees()
    }
}

// MARK: - Extensions

extension EmployeesListViewController: EmployeesListViewModelDelegate {
    func onSuccess(_ type: EmployeesListViewModelUseCases) {
        switch type {
        case .getEmployees:
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

extension EmployeesListViewController: EmployeesListAdapterDelegate {
    
}
