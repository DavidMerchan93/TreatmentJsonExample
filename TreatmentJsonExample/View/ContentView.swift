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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
