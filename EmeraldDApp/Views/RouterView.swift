//
//  RouterView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 8/2/23.
//

import SwiftUI
import FCL

struct RouterView: View {
    @State var loggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.defaultBackgroundColor
                .ignoresSafeArea()
            
            Group {
                if !loggedIn {
                    SignInView()
                } else {
                    ContentView(loggedIn: $loggedIn)
                }
            }
            .padding(.horizontal, 10)
        }
        .onReceive(fcl.$currentUser) { user in
            self.loggedIn = (user != nil)
        }
    }
}

#Preview {
    RouterView()
}
