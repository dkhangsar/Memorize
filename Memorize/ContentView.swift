//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Khangsar on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["😈", "🕷️", "👻", "🎃", "😱", "👹", "🧙", "☠️", "🍭", "🍬", "🐈‍⬛"]
    // array<String> == [String] SAME!
    
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()  // pads only the entire VStack, not everything inside
    }
    
    var cardCountAdjusters: some View {
        HStack{  // considering that this is technically one line of code, there is an implicit return here
            cardRemover
            Spacer() // uses up all the space in between these two
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        // syntax of by offset -- by is used external user, offset used by internal
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {  // if i wanted a doubel tap, (count: 2)
            isFaceUp.toggle()  // views are immuttable -- so @State = temporary state
        }
    }
}




#Preview {
    ContentView()
}
