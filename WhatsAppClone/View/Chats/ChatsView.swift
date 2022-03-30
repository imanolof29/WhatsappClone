//
//  ChatsView.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        Button(action: {
            AuthViewModel.shared.signout()
        }, label: {
            Text("Logout")
        })
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
