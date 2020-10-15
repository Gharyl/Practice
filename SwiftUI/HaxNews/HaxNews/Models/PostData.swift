//
//  PostData.swift
//  HaxNews
//
//  Created by Gary Chen on 10/14/20.
//

import Foundation

//identifiable recognizes order by element, like id, or title etc
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { objectID }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
