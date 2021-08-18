//
//  UserList.swift
//  APIURLSessions
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import Foundation

struct UserList : Decodable {
    var data : [UserListStruct]
}

struct UserListStruct : Decodable {
    var id : Int
    var first_name : String
    var email : String
    var avatar : String
}
 
