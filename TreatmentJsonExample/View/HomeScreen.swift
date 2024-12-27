//
//  HomeScreen.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var postViewModel : PostViewModel
    
    var body: some View {
        NavigationView {
            Text("Bienvenido !!")
                .navigationTitle("JSON APP")
                .navigationBarItems(leading: Button("Siguiente") {
                    
                }, trailing: Button("Salir") {
                    postViewModel.logout()
                })
        }
    }
}
