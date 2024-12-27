//
//  UserDetailViewModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 27/12/24.
//

import Foundation

class UserDetailViewModel : ObservableObject {
    
    @Published var user = User()
    
    func fetchUsers(id: Int) {
        guard let url = URL(string: "https://reqres.in/api/users/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let user = try JSONDecoder().decode(SingleUser.self, from: data)
                DispatchQueue.main.async {
                    self.user = user.data
                }
            } catch let error as NSError {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
        
    }
    
}
