//
//  SignInView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 8/2/23.
//

import SwiftUI
import FCL

struct SignInView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to")
                    .font(.title)
                    .foregroundStyle(Color.white)
                
                Text("Emerald DApp!")
                    .font(.title)
                    .foregroundStyle(Color.defaultAccentColor)
            }
            .padding()
            
            Image("emerald_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            
            ButtonView(title: "Sign In", action: {
                fcl.openDiscovery()
            })
        }
    }
}


#Preview {
    RouterView()
}
