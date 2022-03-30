//
//  WhatsAppCloneApp.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import SwiftUI
import Firebase

@main
struct WhatsAppCloneApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //crea una sola instancia del AuthViewModel
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
