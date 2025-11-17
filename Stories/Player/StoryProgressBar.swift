//
//  StoryProgressBar.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct StoryProgressView: View {
    @Environment(StoryPlayer.self) private var player
    let chaptersCount: Int

    init(chaptersCount: Int) {
        self.chaptersCount = chaptersCount
    }

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<chaptersCount, id: \.self) { index in
                StoryProgressBar(
                    progress: progress(index: index),
                    isCurrent: index == player.currentChapterIndex
                )
                .frame(height: 5)
            }
        }
        .padding(.horizontal)
    }

    private func progress(index: Int) -> Double {
        if index < player.currentChapterIndex {
            return 1
        } else if index == player.currentChapterIndex {
            return player.progress
        } else {
            return 0
        }
    }
}

struct StoryProgressBar: View {
    let progress: Double
    let isCurrent: Bool

    private var trackColor: Color {
        Color.white.opacity(isCurrent ? 0.25 : 0.15)
    }

    private var fillColor: Color {
        Color.white
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(trackColor)

            GeometryReader { geometry in
                Capsule()
                    .fill(fillColor)
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(maxWidth: .infinity)
        .animation(.linear(duration: 0.1), value: progress)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoryProgressView(chaptersCount: 4)
        .environment(StoryPlayer())
        .background(Color.teal.opacity(0.4))
}
