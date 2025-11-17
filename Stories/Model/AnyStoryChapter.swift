//
//  AnyStoryChapter.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct AnyStoryChapter {
    let duration: TimeInterval
    let render: AnyView

    init<C: StoryChapter>(_ chapter: C, overrideDuration: TimeInterval? = nil) {
        self.duration = overrideDuration ?? C.preferredDuration
        self.render = AnyView(chapter)
    }
}
