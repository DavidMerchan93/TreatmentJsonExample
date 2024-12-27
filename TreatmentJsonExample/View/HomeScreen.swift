//
//  HomeScreen.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var postViewModel : PostViewModel
    @StateObject var usersViewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            if usersViewModel.users.isEmpty {
                ProgressView()
            } else {
                List(usersViewModel.users, id: \.id) { user in
                    HStack {
                        Text(String(user.id))
                            .padding(12)
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text(user.email)
                        }.padding(12)
                    }
                }.navigationTitle("JSON APP")
                    .navigationBarItems(leading: Button("Siguiente") {
                        
                    }, trailing: Button("Salir") {
                        postViewModel.logout()
                    })
            }
                
        }
    }
}
