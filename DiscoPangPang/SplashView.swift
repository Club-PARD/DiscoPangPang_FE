//
//  SplashView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.5, blue: 0.32)
                .edgesIgnoringSafeArea(.all)
                    
            VStack {
                Image("GIBOON")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 72)
            }
        }
    }
}

#Preview {
    SplashView()
}
