//
//  UsersListViewModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 27/12/24.
//

import Foundation

class UsersListViewModel: ObservableObject {
    
    @Published var users = UserListModel(total: 0, data: [])
    
    init() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let users = try JSONDecoder().decode(UserListModel.self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                }
            } catch let error as NSError {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
        
    }
    
}
