//
//  NetworkManager.swift
//  HaxNews
//
//  Created by Gary Chen on 10/14/20.
//

import Foundation

//ObservableObject is a protocol that "broadcasts" its properties to other places
class NetworkManager: ObservableObject {
    
    //marking what to broadcast
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            //must be on main thread because of the property "@Published"
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
