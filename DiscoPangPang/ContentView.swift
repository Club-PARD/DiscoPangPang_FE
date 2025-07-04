//
//  ContentView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView()
                .tabItem {
                    Image(tabSelection == 0 ? "Home_" : "Home")
                    Text("홈")
                        .foregroundColor((tabSelection == 0) ? .green : .red)
                }.tag(0)
            
            HistoryView()
                .tabItem {
                    Image(tabSelection == 1 ? "History_" : "History")
                    Text("히스토리")
                }.tag(1)
            
            AddExperienceView()
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
