//
//  ContentView.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if DEBUG
        StoryViewer(story: .mock)
        #else
        Text("Run in Debug mode")
        #endif
    }
}

#Preview {
    ContentView()
}
