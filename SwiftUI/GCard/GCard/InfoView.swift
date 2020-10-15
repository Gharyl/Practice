//
//  InfoView.swift
//  GCard
//
//  Created by Gary Chen on 10/14/20.
//

import SwiftUI

struct InfoView: View {
    
    let text: String, imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color("contactColor"))
            .frame(width: 250, height: 50, alignment: .center)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                    Text(text)
                }
            )
            .foregroundColor(.white)
            .shadow(radius:10)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
