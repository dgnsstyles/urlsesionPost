//
//  NetworkingManager.swift
//  APIURLSessions
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkingManager,Never>()
    
    @Published var userList = UserList(data: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init(){
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            
            if let response = response {
                print(response)
            }
            do{
                guard let data = data else { return }
                let users = try JSONDecoder().decode(UserList.self, from: data)
                DispatchQueue.main.async {
                    self.userList = users
                }
            }catch let error as NSError{
                print("No funciona la api", error.localizedDescription)
            }
            
        }.resume()
        
    }
    

}
