//
//  EmployeeResponse.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation

struct ItemResponse: Decodable {
    var id: Int
    var name: String
    var type: TypeResponse?
    var typeId: Int
    var owner: EmployeeResponse?
    var ownerId: Int?
    var place: PlaceResponse?
    var placeId: Int?
    var lastAssignedDate: String?
    var date: Date?
}
