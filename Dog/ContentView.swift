//
//  ContentView.swift
//  dog
//
//  Created by MANVELYAN Gevorg on 04.10.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label ("Главная", systemImage: "house")
                }
            ArticlesView()
                .tabItem {
                    Label ("Статьи", systemImage: "doc.text")
                }
            TrainingView()
                .tabItem {
                    Label ("Тренировки", systemImage: "figure.american.football")
                }
            MapView()
                .tabItem {
                    Label ("Карта", systemImage: "map")
                }
            ProileView()
                .tabItem {
                    Label ("Профиль", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
