//
//  ContentView.swift
//  POSTURLSession
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var pass = ""
    @ObservedObject var manager = Login()
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Email")
            TextField("Escribe tu email", text: self.$email)
            Text("Password")
            SecureField("Escribe tu password", text: self.$pass)
            Button(action:{
                self.manager.loginDetail(email: self.email, password: self.pass)
            }){
                Text("Entrar")
            }
            if self.manager.authenticated == 1 {
                Text("Genial estas autenticado 😄")
            }else if self.manager.authenticated == 2 {
                Text("Lastima no estas autenticado 😩")
            }
        }.padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
