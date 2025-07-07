//
//  SplashView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var logoOpacity = 0.0
    @State private var logoScale: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.5, blue: 0.32)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("GIBOON_Splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 72)
                    .opacity(logoOpacity)          // 점점 나타나는 효과
                    .scaleEffect(logoScale)        // 확대 효과
                    .onAppear {
                        withAnimation(.easeOut(duration: 2.0)) {
                            logoOpacity = 1.0
                            logoScale = 1.2
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashView()
}
