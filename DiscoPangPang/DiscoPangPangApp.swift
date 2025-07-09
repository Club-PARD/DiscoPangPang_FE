//
//  DiscoPangPangApp.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI
import UserNotifications
import AuthenticationServices


@main
struct DiscoPangPangApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var answerText: [String] = Array(repeating: "", count: 5)
    @State private var selectedIndex: Int = 0
    
    @State private var isLoggedIn: Bool = false          // 로그인 여부
    @State private var showSplash: Bool = true           // 스플래시 표시 여부
    @State private var showAppleLogin: Bool = false
    
    init() {
        //        requestNotificationPermission()
        
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
//            ZStack {
//                if showSplash {
//                    SplashView()
//                        .onAppear {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                                checkAppleLoginStatus()
//                            }
//                        }
//                } else if isLoggedIn {
//                    ContentView(answerText: $answerText,
//                                selectedIndex: $selectedIndex)
//                } else {
//                    SplashView()
//                        .overlay(
//                            AppleLogIn {
//                                // 로그인 성공 시 처리
//                                isLoggedIn = true
//                                UserDefaults.standard.set(true, forKey: "isLoggedIn")
//                            }
//                        )
//                }
//            }
        }
    }
    
    /// ✅ Apple 계정 자동 로그인 체크
    func checkAppleLoginStatus() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        if let storedUserID = UserDefaults.standard.string(forKey: "appleUserId") {
            appleIDProvider.getCredentialState(forUserID: storedUserID) { credentialState, error in
                DispatchQueue.main.async {
                    switch credentialState {
                    case .authorized:
                        print("✅ 자동 로그인 유지됨")
                        self.isLoggedIn = true
                    case .revoked, .notFound:
                        print("⚠️ 자동 로그인 불가 (다시 로그인 필요)")
                        self.isLoggedIn = false
                    default:
                        break
                    }
                    self.showSplash = false
                }
            }
        } else {
            print("🔑 저장된 Apple userId 없음")
            DispatchQueue.main.async {
                self.isLoggedIn = false
                self.showSplash = false
            }
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
    
    /// ✅ 자동 로그인 처리
    func performExistingAccountSetupFlows() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = AppleSignInCoordinator { success in
            DispatchQueue.main.async {
                self.isLoggedIn = success
                self.showSplash = false
            }
        }
        controller.performRequests()
    }
    
    // 테스트용
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
            completionHandler([.banner, .sound])
        }
    }
}
