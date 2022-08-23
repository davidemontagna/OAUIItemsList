//
//  EmployeeResponse.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation

struct Item: Decodable {
    var id: Int
    var name: String
    var type: Type?
    var typeId: Int
    var owner: Employee?
    var ownerId: Int?
    var place: Place?
    var placeId: Int?
    var lastAssignedDate: String?
    var date: Date?
}
