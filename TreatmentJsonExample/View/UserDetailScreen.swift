//
//  UserDetailScreen.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 27/12/24.
//

import SwiftUI

struct UserDetailScreen: View {
    
    let userId: Int
    @StateObject var userDetailViewModel = UserDetailViewModel()
    
    var body: some View {
        VStack {
            if userDetailViewModel.user.id != 0 {
                AsyncImage(url: URL(string: userDetailViewModel.user.avatar))
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(Circle())
                
                Text(String(userDetailViewModel.user.id)).font(.title)
                Text(userDetailViewModel.user.first_name).font(.largeTitle)
                Text(userDetailViewModel.user.last_name)
                Text(userDetailViewModel.user.email).fontWeight(.bold)
                Spacer()
            } else {
                ProgressView()
            }
        }.onAppear {
            userDetailViewModel.fetchUsers(id: userId)
        }.navigationTitle("Detalle de usuario")
    }
}
