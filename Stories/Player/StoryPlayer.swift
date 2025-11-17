//
//  StoryPlayer.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI
import Combine
import Observation

@Observable
final class StoryPlayer {
    var currentChapterIndex: Int = 0
    var isPaused: Bool = false
    var progress: Double = 0

    private var timer: AnyCancellable?
    private var chapters: [AnyStoryChapter] = []

    func configure(with chapters: [AnyStoryChapter]) {
        self.chapters = chapters
        currentChapterIndex = 0
        progress = 0
        startTimer()
    }

    func goForward() {
        guard currentChapterIndex + 1 < chapters.count else {
            progress = 1
            stopTimer()
            return
        }

        currentChapterIndex += 1
        progress = 0
        startTimer()
    }

    func goBackward() {
        guard currentChapterIndex > 0 else { return }
        currentChapterIndex -= 1
        progress = 0
        startTimer()
    }

    func pause() {
        isPaused = true
    }

    func resume() {
        isPaused = false
    }

    private func startTimer() {
        stopTimer()

        guard chapters.indices.contains(currentChapterIndex) else {
            return
        }

        let duration = chapters[currentChapterIndex].duration
        let startDate = Date()

        timer = Timer.publish(every: 1/60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self, isPaused == false else { return }
                let elapsed = Date().timeIntervalSince(startDate)
                progress = min(1, elapsed / duration)

                if progress >= 1 {
                    goForward()
                }
            }
    }

    private func stopTimer() {
        timer?.cancel()
        timer = nil
    }
}
