//
//  TypeResponse.swift
//  OAUIItemsLists
//
//  Created by Davide Montagna on 22/08/22.
//

import Foundation

struct Type: Decodable {
    var id: Int
    var name: String?
    var iconUrl: String?
}
