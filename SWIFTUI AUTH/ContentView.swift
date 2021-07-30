//
//  ContentView.swift
//  SWIFTUI AUTH
//
//  Created by Aryaman Puri on 28/07/21.
//

import SwiftUI
import FirebaseAuth

class AppViewModel : ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    var isSignedIn : Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email : String , password : String) {
        auth.signIn(withEmail: email, password: password )
        { [weak self] result, error  in
            guard result != nil , error == nil else
            {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    
    func signUp(email : String , password : String) {
        auth.createUser(withEmail: email, password: password)
        { [weak self] result ,error in
            guard result != nil , error == nil else {
                return
            }
        
        DispatchQueue.main.async {
            self?.signedIn = true
        }
        }
    }
    
    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
    }
    
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                VStack{
                    Text("You are signed in ")
                        .padding()
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("SIGN OUT")
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .foregroundColor(Color.blue)
                    })
                        .padding()
                }
            }
            else{
            SignInView()
            }
    }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .top)
                
                
                VStack{
                    TextField("Enter Email Address",text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("ENTER PASSWORD" , text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }
                           ,
                           label: {
                        Text("SIGN IN")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                        .padding()
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("WELCOME")
    }
    }



struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel : AppViewModel
    
    var body: some View {
        
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .top)
                
                
                VStack{
                    TextField("Enter Email Address",text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("ENTER PASSWORD" , text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    }
                           ,
                           label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create Account")
    }
    }

