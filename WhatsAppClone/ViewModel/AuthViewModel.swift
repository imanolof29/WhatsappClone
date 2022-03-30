//
//  AuthViewModel.swift
//  WhatsAppClone
//
//  Created by Imanol Ortiz on 30/3/22.
//

import Firebase
import Combine


class AuthViewModel: NSObject, ObservableObject{
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    private var tmpCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init(){
        print("DEBUG: Auth view model did init")
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to login with credentials, error: \(error)")
                return
            }
            
            self.userSession = result?.user
        }
    }
    
    func register(withEmail email:String, password:String, firstname:String, lastname:String, username:String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to register: \(error)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data: [String:Any] = [
                "email": email,
                "username":username,
                "firstName":firstname,
                "lastName":lastname
            ]
            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                print("DEBUG: Succesfully updated user info...")
            }
        }
    }
    
    func signout(){
        print("DEBUG: Logged out from auth viewmodel")
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
}
