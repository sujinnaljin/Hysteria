//
//  HalfView.swift
//  Hysteria
//
//  Created by 강수진 on 2022/10/11.
//

import SwiftUI

enum Position {
    case left
    case right
}

struct SelectedSentence: Identifiable {
    let id = UUID()
    let text: String
}

struct HalfView: View {
    
    let position: Position
    let sentences: [SelectedSentence]
    
    var body: some View {
        VStack {
            ForEach(sentences) { sentence in
                Text(sentence.text)
                    .modifier(AilignmentModifier(position: position))
            }
        }
    }
}

struct AilignmentModifier: ViewModifier {
    let position: Position
    
    func body(content: Content) -> some View {
        HStack {
            if position == .right {
                Spacer()
            }
            content
            if position == .left {
                Spacer()
            }
        }
    }
}
