//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Khangsar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp = false  // this needs to be a var because it could change if it passes
    // we should always want to start with let
    
    var body: some View {
        ZStack {  // allowed to not have () because trailing closure syntaax
            let base = RoundedRectangle(cornerRadius: 12) // let means that it's a var that is CONSTANT
            // type inference -- don't need to write "RoundedRectangle = RoundedRectangle(corner..."
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😄")
            } else {
                base.fill()
            }
        }
        .onTapGesture {  // if i wanted a doubel tap, (count: 2)
            print("tapped")
            isFaceUp.toggle()  // views are immuttable -- so @State = temporary state
        }
    }
}




#Preview {
    ContentView()
}
