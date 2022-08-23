//
//  EmployeesListViewModel.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation
import Alamofire

protocol EmployeesListViewModelDelegate: AnyObject {
    func onSuccess(_ type: EmployeesListViewModelUseCases)
    func onFailure(error: String)
}

class EmployeesListViewModel: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: EmployeesListViewModelDelegate?
    
    // MARK: - Properties
    
    var employeesResponse: [Employee] = []
    var uiitems: [EmployeesListCellUIItem] {
        return employeesResponse.map { i in
            if let name = i.name {
                return EmployeesListCellUIItem(name: name)
            }
            return EmployeesListCellUIItem(name: "??")
        }
    }
    
    // MARK: - ViewModel Lifecycle
    
    init(delegate: EmployeesListViewModelDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - Public methods
    
    func getEmployees() {
        AF.request("https://over-inventory.azurewebsites.net/api/Users").responseDecodable(of: EmployeesResponse.self) { response in
            print([response])
            switch response.result {
            case .failure(let error):
                self.delegate?.onFailure(error: error.localizedDescription)
            case .success(let response):
                self.employeesResponse = response
                self.delegate?.onSuccess(.getEmployees)
            }
        }
    }
}

