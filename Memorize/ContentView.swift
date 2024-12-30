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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.blue)
        .padding()
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.orange)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("😄")
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}




#Preview {
    ContentView()
}
