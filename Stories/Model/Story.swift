//
//  Story.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct Story {
    let chapters: [AnyStoryChapter]

    init(@StoryChapterBuilder content: () -> [AnyStoryChapter]) {
        self.chapters = content()
    }
}

#if DEBUG
extension Story {
    static let mock: Story = Story {
        HighlightChapter(title: "Top Moments")

        YearGraphChapter()

        FunFactChapter()

        CustomChapter({
            ZStack {
                Color.pink
                VStack {
                    Text("A custom screen")
                    Text("Duration overriden to 4 seconds")
                }
            }
        }, duration: 4)
    }
}
#endif
