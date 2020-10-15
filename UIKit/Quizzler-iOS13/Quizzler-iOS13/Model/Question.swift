//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gary Chen on 10/4/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let questions: String
    let answer: String
    
    init(q:String,a:String){
        questions=q
        answer=a
    }
}
