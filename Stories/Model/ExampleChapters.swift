//
//  ExampleChapters.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct HighlightChapter: StoryChapter {
    static var preferredDuration: TimeInterval = 5

    let title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
            Text(title)
                .font(.largeTitle.bold())
        }
    }
}

struct YearGraphChapter: StoryChapter {
    static var preferredDuration: TimeInterval = 6

    var body: some View {
        ZStack {
            Color.orange.opacity(0.5)
            Text("Your year")
                .font(.largeTitle.bold())
        }
    }
}

struct FunFactChapter: StoryChapter {
    var body: some View {
        ZStack {
            Color.green.opacity(0.5)
            Text("Hi Nikita 👋")
                .font(.largeTitle.bold())
        }
    }
}
