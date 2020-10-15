//
//  ContentView.swift
//  GCard
//
//  Created by Gary Chen on 10/14/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            RadialGradient(gradient: Gradient(colors: [Color("backgroundColor"), .white]), center: .top, startRadius: 500, endRadius:1000)
                .ignoresSafeArea()
            VStack(){
                Image("gary")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .top)
                Text("Gary Chen")
                    .bold()
                    .foregroundColor(.white)
                    .font(Font.custom("AmaticSC-Bold", size: 50))
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(Font.custom("Quicksand-VariableFont_wght", size: 20))
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
                VStack(alignment: .leading) {
                    InfoView(text: "gc.gary94@mail.com", imageName: "envelope.badge")
                        .padding(.top)
                    InfoView(text: "Github", imageName: "list.bullet.rectangle")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
