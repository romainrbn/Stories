//
//  StoriesApp.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

@main
struct StoriesApp: App {

    @State var storyPlayer = StoryPlayer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(storyPlayer)
        }
    }
}
