//
//  MessageView.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import SwiftUI

struct MessageView: View {
    
    var isFromCurrentUser:Bool
    
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text("Some text message")
                    .padding(12)
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
            }else{
                HStack(alignment: .bottom){
                    Image("")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    Text("Some text message")
                        .padding(12)
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(isFromCurrentUser: true)
    }
}
