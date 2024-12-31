//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Khangsar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😈", "🕷️", "👻", "🎃"]
    // array<String> == [String] SAME!
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp = true  // this needs to be a var because it could change if it passes
    // we should always want to start with let
    let content: String
    var body: some View {
        ZStack {  // allowed to not have () because trailing closure syntaax
            let base = RoundedRectangle(cornerRadius: 12) // let means that it's a var that is CONSTANT
            // type inference -- don't need to write "RoundedRectangle = RoundedRectangle(corner..."
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base.fill()
            }
        }
        .onTapGesture {  // if i wanted a doubel tap, (count: 2)
            isFaceUp.toggle()  // views are immuttable -- so @State = temporary state
        }
    }
}




#Preview {
    ContentView()
}
