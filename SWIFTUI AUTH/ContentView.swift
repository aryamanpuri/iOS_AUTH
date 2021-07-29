//
//  ContentView.swift
//  SWIFTUI AUTH
//
//  Created by Aryaman Puri on 28/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .top)
                
                
                VStack{
                    TextField("Enter Email Address",text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    SecureField("ENTER PASSWORD" , text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                    Button(action: {}
                           ,
                           label: {
                        Text("SIGN IN")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("SIGN IN SIGN OUT")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
