//
//  CustomChapter.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct CustomChapter: StoryChapter {
    static var preferredDuration: TimeInterval = 5

    private let view: AnyView
    private let duration: TimeInterval?

    public init<V: View>(@ViewBuilder _ view: () -> V, duration: TimeInterval? = nil) {
        self.view = AnyView(view())
        self.duration = duration
    }

    var body: some View {
        view
    }

    public static func chapter(
        _ duration: TimeInterval,
        @ViewBuilder view: () -> some View
    ) -> (chapter: CustomChapter, duration: TimeInterval) {
        (CustomChapter(view, duration: duration), duration)
    }
}
