//
//  LoginView.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                }
                
                Text("Hello.")
                    .font(.largeTitle)
                    .bold()
                Text("Welcome back")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 20){
                    TextField("Email", text:$email)
                    SecureField("Password", text: $password)
                }
                .padding([.top, .horizontal], 32)
                
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: Text("Reset password..."),
                        label: {
                            Text("Forgot Password?")
                                        .font(.system(size: 13, weight: .semibold))
                                        .padding(.top)
                                        .padding(.trailing, 28)
                        })
                }
                
                Button(action:{
                    AuthViewModel.shared.login(withEmail: email, password: password)
                }, label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                    .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()
                
                NavigationLink(
                    destination: RegistrationView(),
                    label: {
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .padding(.bottom, 32)
                    }
                )
                
            }
            .padding(.leading)
        }
        .padding(.top, -56)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
