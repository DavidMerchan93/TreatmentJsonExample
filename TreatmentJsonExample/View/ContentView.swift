//
//  ContentView.swift
//  TreatmentJsonExample
//
//  Created by David Merchan on 23/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var postViewModel = PostViewModel()
    
    var body: some View {
        LoginScreen()
    }
}

#Preview {
    ContentView()
}
