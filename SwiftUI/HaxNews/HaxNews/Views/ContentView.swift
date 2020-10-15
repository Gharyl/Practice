//
//  ContentView.swift
//  HaxNews
//
//  Created by Gary Chen on 10/14/20.
//

import SwiftUI

struct ContentView: View {
    
    //listens to the broadcast
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            //when networkManager.posts updates, the List rerenders
            List(networkManager.posts){ post in
                //Adds a link to each cell/label in List; transitions to DetailView
                NavigationLink(destination: DetailView(url:post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                            .font(Font.system(size: 15))
                    }
                }
            }
            .navigationBarTitle("HaxNews")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
