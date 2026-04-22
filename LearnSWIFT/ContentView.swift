//
//  ContentView.swift
//  LearnSWIFT
//
//  Created by Slaveyko Slaveykov on 5.04.26.
//

import SwiftUI
import Utils

struct ContentView: View {
    @State private var cardIDs: [UUID] = (0..<10).map { _ in UUID() }
    let x = 300
    let y = 300

    var items: [some View] {
        cardIDs.map { cardID in
            RandomImage(x, y)
                .id(cardID)
                .padding(5)
        }
    }

    var body: some View {
        VStack {
            HStack {
                HorizontalRollView(
                    views: items,
                    frame: (x: CGFloat(x), y: CGFloat(y)),
                    background: .gray
                )
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()

                    ForEach(Array(items.enumerated()), id: \.offset) {
                        index,
                        item in
                        item
                            .background(.gray)
                            .frame(width: CGFloat(x), height: CGFloat(y))
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)

        }
    }
}

#Preview {
    ContentView()
}
