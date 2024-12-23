//
//  PostViewModel.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var authenticated = 0
    
    init() {
        login(email: "eve.holt@reqres.in", password: "cityslicka")
    }
    
    func login(email: String, password: String) {
        // Configuramos la URL
        guard let url = URL(string: "https://reqres.in/api/login") else { return }

        // Serializamos los parametros
        let parameters = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parameters)

        // Configuramos el request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Realizamos el llamado a la API
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            // Procesamos la respuesta de manera asincrona para no bloquear el hilo principal
            DispatchQueue.main.async {
                do {
                        // Decodificamos la respuesta
                    let result = try JSONDecoder().decode(PostModel.self, from: data)
                    if !result.token.isEmpty {
                        print("Login exitoso")
                        self.authenticated = 1
                    }
                    
                } catch let error as NSError {
                    print("Ocurrio un error en el login: \(error.localizedDescription)")
                    self.authenticated = 0
                }
                
            }
            
        }.resume()
    }
    
}
