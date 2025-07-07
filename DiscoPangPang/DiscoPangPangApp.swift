//
//  DiscoPangPangApp.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI
import UserNotifications

@main
struct DiscoPangPangApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @State private var answerText: String = ""
    @State var answerText: [String] = Array(repeating: "", count: 5)
    @State private var selectedIndex: Int = 0
    
    init() {
        requestNotificationPermission()
        
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
            ContentView(answerText: $answerText, selectedIndex: $selectedIndex)
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("✅ 알림 권한 허용됨")
            } else {
                print("❌ 알림 권한 거부됨: \(error?.localizedDescription ?? "알 수 없음")")
            }
        }
    }
}
//테스트용
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    // 포그라운드에서도 알림 띄우기
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                 willPresent notification: UNNotification,
                                 withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound]) // ⬅️ 여기 중요
    }
}

