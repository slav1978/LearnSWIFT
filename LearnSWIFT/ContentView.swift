//
//  ContentView.swift
//  LearnSWIFT
//
//  Created by Slaveyko Slaveykov on 5.04.26.
//

import SwiftUI
import Apis
import Randoms
import Utils

/// A SwiftUI view that displays random user information, including their picture and name.
struct ContentView: View {

    var body: some View {
        /// Renders two vertically stacked random user cards within the view body.
        List {
            ForEach(0..<2) { index in
                HStack {
                    RandomUser(.picture)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack (alignment: .leading) {
                        RandomUser(.username)
                        Text("User \(index + 1)")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Button("Follow") {
                    }
                    .buttonStyle(.borderedProminent)
                }
        }
            
        }
    }
}

#Preview {
    ContentView()
}
