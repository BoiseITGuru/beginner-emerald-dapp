//
//  RouterView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 8/2/23.
//

import SwiftUI

struct RouterView: View {
    @State var loggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.defaultBackgroundColor
                .ignoresSafeArea()
            
            Group {
                if !loggedIn {
                    SignInView(loggedIn: $loggedIn)
                } else {
                    ContentView()
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    RouterView()
}
