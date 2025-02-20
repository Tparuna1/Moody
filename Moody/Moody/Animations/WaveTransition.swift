//
//  WaveTransition.swift
//  Moody
//
//  Created by tornike <parunashvili on 07.11.24.
//

import SwiftUI

struct WaveTransition: ViewModifier {
    var isActive: Bool

    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? 1 : 0.8)
            .opacity(isActive ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: isActive)
    }
}

extension View {
    func waveTransition(isActive: Bool) -> some View {
        self.modifier(WaveTransition(isActive: isActive))
    }
}
