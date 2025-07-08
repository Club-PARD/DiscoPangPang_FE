//
//  AppleLogIn.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/7/25.
//

import SwiftUI
import AuthenticationServices


struct AppleLogIn: View {
    
    var onLoginSuccess: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            SignInWithAppleButton(
                .signIn,
                onRequest: configure,
                onCompletion: handle
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50)
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
    
    // 사용자가 로그인 버튼을 눌렀을 때 요청 설정
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.fullName, .email]
    }
    
    // 로그인 결과 처리
    func handle(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            if let credential = auth.credential as? ASAuthorizationAppleIDCredential {
                let userId = credential.user
                let email = credential.email ?? "(이전에 로그인하여 이메일 없음)"
                let fullName = credential.fullName?.givenName ?? ""
                
                print("🔓 로그인 성공")
                print("🧑‍💻 userId: \(userId)")
                print("📧 email: \(email)")
                print("👤 name: \(fullName)")
                
                // UserDefaults에 저장
                UserDefaults.standard.set(true, forKey: "isLoggedIn")           // 로그인 상태 저장
                UserDefaults.standard.set(userId, forKey: "appleUserId")        // 유저 고유 ID 저장
                UserDefaults.standard.set(email, forKey: "appleUserEmail")      // 이메일 저장
                UserDefaults.standard.set(fullName, forKey: "appleUserName")    // 이름 저장
                
                // 부모 뷰에 알려주기
                onLoginSuccess()
            }
        case .failure(let error):
            print("❌ 로그인 실패: \(error.localizedDescription)")
        }
    }
}




class AppleSignInCoordinator: NSObject, ASAuthorizationControllerDelegate {
    let completion: (Bool) -> Void

    init(completion: @escaping (Bool) -> Void) {
        self.completion = completion
    }

    // 자동 로그인 성공
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            print("✅ 자동 로그인 성공: \(credential.user)")
            self.completion(true)
        } else {
            self.completion(false)
        }
    }

    // 자동 로그인 실패
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("❌ 자동 로그인 실패: \(error.localizedDescription)")
        self.completion(false)
    }
}
