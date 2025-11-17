//
//  StoryChapter.swift
//  Stories
//
//  Created by Romain Rabouan on 11/17/25.
//

import SwiftUI

protocol StoryChapter: View {
    static var preferredDuration: TimeInterval { get }
}

extension StoryChapter {
    static var preferredDuration: TimeInterval { 3 }
}
