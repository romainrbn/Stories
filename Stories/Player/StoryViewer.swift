//
//  StoryViewer.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct StoryViewer: View {
    let story: Story
    @Environment(StoryPlayer.self) var player

    private var currentChapter: AnyStoryChapter {
        story.chapters[player.currentChapterIndex]
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                currentChapter.render
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .transition(.opacity.animation(.easeInOut))
                    .id(player.currentChapterIndex)

                VStack {
                    StoryProgressView(chaptersCount: story.chapters.count)
                    Spacer()
                }
                .padding(.top, 20)
            }
            .onAppear {
                player.configure(with: story.chapters)
            }
            .onTapGesture { location in
                let screenWidth = proxy.size.width
                if location.x < screenWidth / 3 {
                    player.goBackward()
                } else {
                    player.goForward()
                }
            }
        }
    }
}

#Preview {
    StoryViewer(story: Story.mock)
        .environment(StoryPlayer())
}
