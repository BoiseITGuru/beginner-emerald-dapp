//
//  ButtonView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 8/2/23.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title2)
                .foregroundStyle(Color.defaultTextColor)
        }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color.defaultAccentColor)
            .cornerRadius(15)
            .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ButtonView(title: "Button View", action: {})
}
