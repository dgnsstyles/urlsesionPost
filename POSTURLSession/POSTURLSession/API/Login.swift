//
//  Login.swift
//  POSTURLSession
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


// combine es el framework reactivo de ios nativo existe otro externo llamado RXSwift

class Login: ObservableObject {
    var didChange = PassthroughSubject<Login,Never>()
    
    @Published var authenticated = 0 {
        didSet {
            didChange.send(self)
        }
    }
    
    func loginDetail(email: String, password: String){
        guard let url = URL(string: "https://reqres.in/api/login") else { return  }
        let parametros : [String:String] = ["email":email,"password":password]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            
//            if let response = response {
//                print(response)
//            }
            guard let data = data else { return }
            do {
                let datos = try JSONDecoder().decode(Respuesta.self, from: data)
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        self.authenticated = 1
                    }
                }
            }catch{
                print("error al logearse")
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
        
    }
}
