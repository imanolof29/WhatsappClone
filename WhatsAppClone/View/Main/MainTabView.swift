//
//  MainTabView.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        NavigationView{
            TabView{
                ChatsView()
                    .tabItem{
                        Image(systemName: "bubble.left")
                    }
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tag(0)
                SettingsView()
                    .tabItem{
                        Image(systemName: "gear")
                    }
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tag(1)
            }
            .navigationTitle(tabTitle)
        }
    }
    
    var tabTitle:String {
        switch selectedIndex{
        case 0: return "Chats"
        case 1: return "Settings"
        default: return ""
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
