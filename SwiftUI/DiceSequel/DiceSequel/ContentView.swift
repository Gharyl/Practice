//
//  ContentView.swift
//  DiceSequel
//
//  Created by Gary Chen on 10/14/20.
//

import SwiftUI

struct ContentView: View {
    
    //struct is immutable, but @State can force it?
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack(){
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 40){
                Image("diceeLogo")
                
                Spacer()
                
                HStack(spacing: 40){
                    DiceView(dice: leftDiceNumber)
                    DiceView(dice: rightDiceNumber)
                }
                
                Spacer()
                
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }, label: {
                    Text("Roll")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    
    let dice: Int
    
    var body: some View {
        Image("dice\(dice)")
    }
}
