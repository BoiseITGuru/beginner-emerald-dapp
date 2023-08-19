//
//  ContentView.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 7/20/23.
//

import SwiftUI
import FCL

struct ContentView: View {
    @Binding var loggedIn: Bool
    @State var greetingDisplay = ""
    @State var inputText = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 6) {
                Image("emerald_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                Text("Emerald DApp")
                    .font(.title)
                    .foregroundStyle(Color.defaultAccentColor)
            }
            
            Text(greetingDisplay)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .foregroundStyle(Color.white)
                .background(Color.secondaryAccentColor)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.defaultAccentColor, lineWidth: 3)
                )
                .padding(.bottom, 20)
                .task {
                    await getGreeting()
                }

            TextField("Change Greeting", text: $inputText)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.secondaryAccentColor)
                .cornerRadius(15)
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.defaultAccentColor, lineWidth: 3)
                )
                .padding(.bottom, 4)
            
            ButtonView(title: "Change Greeting", action: {
                Task {
                    await changeGreeting()
                }
            })

            Spacer()
            
            ButtonView(title: "Sign Out: \(fcl.currentUser?.address.hex ?? "")") {
                Task {
                    try? await fcl.unauthenticate()
                }
            }
        }
    }
    
    func getGreeting() async {
        do {
            let result = try await fcl.query(script: """
                import HelloWorld from 0xDeployer

                pub fun main(): String {
                  return HelloWorld.greeting
                }
            """).decode(String.self)
            
            await MainActor.run {
                greetingDisplay = result
            }
        } catch {
            print(error)
        }
    }
    
    func changeGreeting() async {
        do {
            let txId = try await fcl.mutate(
                cadence: """
                    import HelloWorld from 0xDeployer

                    transaction(myNewGreeting: String) {

                      prepare(signer: AuthAccount) {}

                      execute {
                        HelloWorld.changeGreeting(newGreeting: myNewGreeting)
                      }
                    }
                """,
                args: [
                    .string(inputText)
                ]
            )
            
            print(txId.hex)
            
            _ = try await txId.once(status: .pending)
            await MainActor.run {
                greetingDisplay = "Tx Pending"
            }
            
            _ = try await txId.onceExecuted()
            await MainActor.run {
                greetingDisplay = "Tx Executed"
            }
            
            _ = try await txId.onceSealed()
            await MainActor.run {
                greetingDisplay = "Tx Sealed"
            }
            
            await getGreeting()
        } catch {
            print(error)
        }
    }
}

#Preview {
    RouterView()
}
