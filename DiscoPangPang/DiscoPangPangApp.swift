//
//  DiscoPangPangApp.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

@main
struct DiscoPangPangApp: App {
    
    @State private var showSplash = true // ✅ Splash 화면 표시 여부
    //    @State private var answerText: String = ""
    @State var answerText: [String] = Array(repeating: "", count: 5)
    @State private var selectedIndex: Int = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground() // 투명한 배경 설정
        appearance.backgroundColor = UIColor.white.withAlphaComponent(0.95) // 반투명 흰색
        
        // 기본 appearance 적용
        UITabBar.appearance().standardAppearance = appearance
        
        // iOS 15 이상일 경우 scrollEdgeAppearance도 설정해야 반영됨
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
            //            ContentView(answerText: $answerText, selectedIndex: $selectedIndex)
            if showSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            // ✅ 2초 후 Splash 사라지고 ContentView로 전환
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                ContentView(
                    answerText: $answerText,
                    selectedIndex: $selectedIndex
                )
            }
        }
    }
}
