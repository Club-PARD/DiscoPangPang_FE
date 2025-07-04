//
//  DiscoPangPangApp.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

@main
struct DiscoPangPangApp: App {
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
            ContentView()
        }
    }
}
