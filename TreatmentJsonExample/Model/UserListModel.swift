//
//  UserListModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 27/12/24.
//

import Foundation

struct UserListModel: Decodable {
    let total: Int
    let data: [User]
}

struct SingleUser: Decodable {
    let data: User
}

struct User: Decodable {
    var id: Int = 0
    var first_name: String = ""
    var last_name: String = ""
    var email: String = ""
    var avatar: String = ""
}
