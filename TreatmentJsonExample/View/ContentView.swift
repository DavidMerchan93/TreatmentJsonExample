//
//  ContentView.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var postViewModel: PostViewModel
    
    var body: some View {
        Group {
            switch postViewModel.authenticated {
            case 0:
                LoginScreen()
            case 1:
                HomeScreen()
            default:
                VStack {
                    Text("Ocurrio un error en el login")
                    Button("Reiniciar") {
                        postViewModel.authenticated = 1
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
