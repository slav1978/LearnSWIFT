import SwiftUI

/// A custom SwiftUI view that creates a horizontally scrollable carousel of views (frames) with a 3D rotation effect.
/// The view takes 1) an array of content views, 2) a specified size for each frame, and 3) a background color that
/// defaults to `.clear`. As the user scrolls through the frames, they rotate slightly based on their position in the
/// scroll view, creating a dynamic and engaging visual effect.
struct HorizontalRollView<Content: View>: View {
    let views: [Content]
    let frame: (x: CGFloat, y: CGFloat)
    let background: Color
    enum scrollBehavior { case flat, roll }
    let scroll: scrollBehavior
    
    init(views: [Content], frame: (x: CGFloat, y: CGFloat) = (x: 200, y: 200), background: Color = Color.clear, scroll: scrollBehavior = .roll) {
        self.views = views
        self.frame = frame
        self.background = background
        self.scroll = scroll
    }

    var body: some View {
        GeometryReader { fullView in
            let sidePadding = (fullView.size.width - frame.x) / 2
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(Array(views.enumerated()), id: \.offset) { index, view in
                        GeometryReader { geo in
                            view
                                .frame(width: frame.x, height: frame.y)
                                .background(background)
                                .rotation3DEffect(
                                    .degrees(-geo.frame(in: .scrollView).minX + sidePadding) / 8,
                                    axis: (x: 0, y: (scroll == .roll ? 1 : 0), z: 0)
                                )
                                .frame(width: frame.x, height: frame.y * 1.25)

                        }
                        .frame(width: frame.x, height: frame.y * 1.25)
                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal, sidePadding)
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .frame(height: frame.y * 1.25)
    }
}
