//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by macbook on 23/01/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    // Observes objectWillChange.send() and redraws view
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture() {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader() { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                    .aspectRatio(2/3, contentMode: .fit)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                    .aspectRatio(2/3, contentMode: .fit)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
