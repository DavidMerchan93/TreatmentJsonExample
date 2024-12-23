//
//  LoginScreen.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var postViewModel : PostViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            Text("Email:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            Text("Password:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                postViewModel.login(email: email, password: password)
            }) {
                Text("Login")
                    .frame(width: 200, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(40)
            }
            
        }.padding()
    }
}

#Preview {
    LoginScreen()
}
