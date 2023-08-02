//
//  ContentView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var inputText = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to")
                    .font(.title)
                
                Text("Emerald DApp!")
                    .font(.title)
                    .foregroundStyle(Color.green)
            }
            .padding()

            Image("emerald_logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            
            TextField("Change Greeting", text: $inputText)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .cornerRadius(15)
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 3)
                )
                .padding(.bottom, 4)
            
            Button {
                print(inputText)
            } label: {
                Text("Hello")
                    .font(.title2)
            }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.green)
                .cornerRadius(15)
                .buttonStyle(PlainButtonStyle())

            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    ContentView()
}
