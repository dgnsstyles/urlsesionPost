//
//  ContentView.swift
//  APIURLSessions
//
//  Created by Jorge Maldonado Borbón on 19/11/19.
//  Copyright © 2019 Jorge Maldonado Borbón. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkingManager = NetworkingManager()
    
    var body: some View {
        NavigationView{
            List(self.networkingManager.userList.data, id: \.id){ user in
                HStack{
                    ImageView(imageUrl: user.avatar)
                        .frame(width: 100, height: 100)
                        .clipped()
                    VStack (alignment: .leading){
                        Text(user.first_name)
                            .font(.title)
                            .bold()
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

struct ImageView: View {
    
    @ObservedObject var imageLoader : ImageLoader
    
    init(imageUrl: String){
        imageLoader = ImageLoader(imageUrl: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: ((imageLoader.data.count == 0) ? UIImage(systemName: "photo") : UIImage(data: imageLoader.data))!)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
