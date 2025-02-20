//
//  ContentView.swift
//  Moody
//
//  Created by tornike <parunashvili on 07.11.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = Coordinator()

    var body: some View {
        ZStack {
            getPageView(for: coordinator.currentPage)
                .waveTransition(isActive: true)
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -100 {
                        coordinator.goToNextPage()
                    } else if value.translation.width > 100 {
                        coordinator.goToPreviousPage()
                    }
                }
        )
        .animation(.easeInOut(duration: 0.6), value: coordinator.currentPage)
    }

    @ViewBuilder
    private func getPageView(for page: Coordinator.Page) -> some View {
        switch page {
        case .sunny:
            SunnyView()
        case .rainy:
            RainyView()
        case .cloudy:
            CloudyView()
        case .snowy:
            SnowyView()
        }
    }
}



struct SunnyView: View {
    var body: some View {
        ZStack {
            Image.sunny
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct RainyView: View {
    var body: some View {
        ZStack {
            Image.rainy
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CloudyView: View {
    var body: some View {
        ZStack {
            Image.cloudy
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SnowyView: View {
    var body: some View {
        ZStack {
            Image.snowy
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }
    }
}
