//
//  FlowManager.swift
//  EmeraldDApp
//
//  Created by BoiseITGuru on 8/3/23.
//

import FCL
import Flow
import Foundation

let flowManager = FlowManager.shared

class FlowManager: NSObject, ObservableObject {
    static let shared = FlowManager()

    let testAccount = "0x90250c4359cebac7"

    func setup() {
        let defaultProvider: FCL.Provider = .lilico
        let defaultNetwork: Flow.ChainID = .testnet
        let accountProof = FCL.Metadata.AccountProofConfig(appIdentifier: "EmeraldDAppV1")
        let walletConnect = FCL.Metadata.WalletConnectConfig(urlScheme: "emeraldDApp://", projectID: "485264ff93ea1a0e78e96a740c1e775d")
        let metadata = FCL.Metadata(appName: "Emerald DApp!",
                                    appDescription: "Hello Word Demo App for Emerald Academy",
                                    appIcon: URL(string: "https://academy.ecdao.org/ea-logo.png")!,
                                    location: URL(string: "https://academy.ecdao.org/")!,
                                    accountProof: accountProof,
                                    walletConnectConfig: walletConnect)
        fcl.config(metadata: metadata,
                   env: defaultNetwork,
                   provider: defaultProvider)

        fcl.config
            .put("0xDeployer", value: testAccount)
    }
}
