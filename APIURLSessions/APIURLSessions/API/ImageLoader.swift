//
//  ImageLoader.swift
//  APIURLSessions
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    
    @Published var data = Data(){
        didSet{
            didChange.send(data)
        }
    }
    
    init(imageUrl: String){
        guard let url = URL(string: imageUrl) else { return  }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
    
}
