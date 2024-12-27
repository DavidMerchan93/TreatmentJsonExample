//
//  UsersListScreen.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 27/12/24.
//

import SwiftUI

struct UsersListScreen: View {
    
    @StateObject var usersListViewModel = UsersListViewModel()
    
    var body: some View {
        if usersListViewModel.users.data.isEmpty {
            ProgressView()
        } else {
            List(usersListViewModel.users.data, id: \.id) { user in
                NavigationLink(destination: UserDetailScreen(userId: user.id)) {
                    HStack {
                        AsyncImage(url: URL(string: user.avatar))
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(String(user.id)).font(.title)
                            Text(user.first_name)
                        }
                    }
                }
            }
        }
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self.resizable()
    }
}
