//
//  EmeraldDAppApp.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 7/20/23.
//

import SwiftUI

@main
struct EmeraldDAppApp: App {
    
    init() {
        flowManager.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            RouterView()
        }
    }
}
