//
//  SwiftUIView.swift
//  ChatAI
//
//  Created by Jordyn Fulbright on 5/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Waiting 45 seconds...")
                
                if shouldNavigate {
                    NavigationLink(destination: DestinationView(), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                }
            }
            .onAppear {
                startTimer()
            }
            .navigationBarTitle("Home")
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 45) {
            shouldNavigate = true
        }
    }
}

struct DestinationView: View {
    var body: some View {
        Text("Navigated to Destination View")
            .navigationBarTitle("Destination")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
