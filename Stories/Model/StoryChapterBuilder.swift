//
//  StoryChapterBuilder.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

@resultBuilder
enum StoryChapterBuilder {
    static func buildBlock(_ components: AnyStoryChapter...) -> [AnyStoryChapter] {
        components
    }

    static func buildExpression<C: StoryChapter>(_ chapter: C) -> AnyStoryChapter {
        AnyStoryChapter(chapter)
    }

    public static func buildExpression<C: StoryChapter>(
        override component: (chapter: C, duration: TimeInterval)
    ) -> AnyStoryChapter {
        AnyStoryChapter(component.chapter, overrideDuration: component.duration)
    }

    public static func buildArray(_ components: [[AnyStoryChapter]]) -> [AnyStoryChapter] {
        components.flatMap { $0 }
    }

    public static func buildOptional(_ component: [AnyStoryChapter]?) -> [AnyStoryChapter] {
        component ?? []
    }

    public static func buildEither(first: [AnyStoryChapter]) -> [AnyStoryChapter] {
        first
    }

    public static func buildEither(second: [AnyStoryChapter]) -> [AnyStoryChapter] {
        second
    }
}
