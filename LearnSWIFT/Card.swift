import SwiftUI

/// A custom SwiftUI view that represents a card with a title, description, image, and a like button.
/// The card displays an image at the top, followed by the title and description.
/// The like button allows users to like the card, which updates the like count displayed next to it.
/// The card is styled with rounded corners and a blue background for the text area.
struct Card<Content: View>: View, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: Content
    let size: (x: CGFloat, y: CGFloat)

    // An initializer that sets the title, description, image, and size of the card. The size has a default value of (320, 400) if not provided.
    init(_ title: String, _ description: String, image: Content, size: (CGFloat, CGFloat) = (320, 400)) {
        self.title = title
        self.description = description
        self.image = image
        self.size = size
    }

    // States to manage the like button and the number of likes
    @State private var isLiked: Bool = false
    @State private var likes = 0

    var body: some View {

        VStack(spacing: 2) {
            image
                // .resizable()
                .scaledToFill()
                .frame(height: size.y)
                .clipped()
            VStack(spacing: 5) {
                HStack {
                    Text("\(title)")
                    Spacer()
                    Button {
                        isLiked = true
                        likes += 1
                    } label: {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                    }
                    Text("\(likes)")
                }
                .font(.headline)
                .fontWeight(.bold)

                HStack {
                    Text("\(description)")
                    Spacer()
                }

            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.blue)
            .foregroundStyle(.white)
        }
        .frame(width: size.x, alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ContentView()
}
