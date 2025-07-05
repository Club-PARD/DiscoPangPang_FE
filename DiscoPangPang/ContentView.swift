//
//  ContentView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

enum Route: Hashable {
    case addTag1
    case addTag2
    case addTag3
    case addTag4
}

struct ContentView: View {
    @State private var tabSelection = 0
    @State private var path = NavigationPath()
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(tabSelection == 0 ? "Home_" : "Home")
                    Text("홈")
                }.tag(0)
            
            NavigationStack{
                HistoryView()
            }
                .tabItem {
                    Image(tabSelection == 1 ? "History_" : "History")
                    Text("히스토리")
                }.tag(1)
            
            NavigationStack(path: $path) {
                AddExperienceView(path: $path, tabSelection: $tabSelection)
                    .navigationTitle("경험 추가")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .addTag1:
                            AddTag1View(path: $path, tabSelection: $tabSelection)
                        case .addTag2:
                            AddTag2View(path: $path, tabSelection: $tabSelection)
                        case .addTag3:
                            AddTag3View(path: $path, tabSelection: $tabSelection)
                        case .addTag4:
                            AddTag4View(path: $path, tabSelection: $tabSelection)
                        }
                    }
            }
                .tabItem {
                    Image(tabSelection == 2 ? "Add_" : "Add")
                    Text("경험추가")
                }.tag(2)
            
            AnalysisView()
                .tabItem {
                    Image(tabSelection == 3 ? "Analysis_" : "Analysis")
                    Text("분석")
                }.tag(3)
            
            MyView()
                .tabItem {
                    Image(tabSelection == 4 ? "My_" : "My")
                    Text("마이페이지")
                }.tag(4)
        }
        .tint(Color(red: 1, green: 0.5, blue: 0.32))
    }
}


#Preview {
    ContentView()
}
