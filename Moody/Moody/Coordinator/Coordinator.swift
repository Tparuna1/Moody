//
//  Coordinator.swift
//  Moody
//
//  Created by tornike <parunashvili on 07.11.24.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Page: CaseIterable {
        case sunny, rainy, cloudy, snowy
    }

    let pages = Page.allCases
    @Published var currentIndex: Int = 0

    var currentPage: Page {
        pages[currentIndex]
    }

    func goToNextPage() {
        currentIndex = (currentIndex + 1) % pages.count
    }
    
    func goToPreviousPage() {
        currentIndex = (currentIndex - 1 + pages.count) % pages.count
    }
}
