//
//  ContentView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to Emerald DApp!")
                .font(.title)
                .padding()

            Image("emerald_logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
