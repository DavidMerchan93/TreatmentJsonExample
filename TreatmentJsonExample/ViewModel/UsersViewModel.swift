//
//  UsersViewModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 26/12/24.
//

import Foundation

class UsersViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    
    init() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                DispatchQueue.main.async {
                    self.users = users
                }
            } catch let error as NSError {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
        
    }
    
}
