//
//  UserModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 26/12/24.
//

import Foundation

struct UserModel: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
}
