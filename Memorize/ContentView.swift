//
//  ContentView.swift
//  Memorize
//
//  Created by macbook on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        let font = viewModel.cards.count < 10 ? Font.largeTitle : Font.title
        return HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture() {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(font)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                    .aspectRatio(2/3, contentMode: .fit)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3.0)
                    .aspectRatio(2/3, contentMode: .fit)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
