//
//  UserItem.swift
//  LearnSWIFT
//
//  Created by Slaveyko Slaveykov on 3.05.26.
//

import SwiftUI
import Apis

struct ListItemUser: View, Identifiable {
    let id = UUID()
    @State private var user = [String: String]()
    @State private var image = UIImage()
    @State private var followed = false

    var body: some View {
        HStack {
            Image(uiImage: image)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(user["username"] ?? "Loading...")
                    .fontWeight(.semibold)
                Text(user["name"] ?? "Loading...")
                    .font(.system(size: 14))
            }

            Spacer()
            
            Button(followed ? "Following" : "Follow") {
                    followed.toggle()
                }
                .frame(width: 100)
                .padding(.vertical, 4)
                .foregroundStyle(followed ? .gray : .black)
                .background(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(followed ? .gray : .black, lineWidth: 1)
                )
        }
        .task {
            if let fetchedUser = try? await getRandomUser() {
                user = fetchedUser
            }

            if let fetchedImage = try? await APIGet.fetchImage(url: user["pictureThumbnail"] ?? "") {
                image = fetchedImage
            }
        }
    }
}

#Preview {
    ListItemUser()
}
