//
//  HistorySectionView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct HistorySectionBox: View {
    let title: String
    let imageName: String
    let tags: String
    let titleColor: Color
    let gradientColors: [Color]

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(title)
                .font(Font.custom("Pretendard", size: 13).weight(.semibold))
                .foregroundColor(titleColor)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 57, height: 64)

            Text(tags)
                .font(Font.custom("Pretendard", size: 11))
                .foregroundColor(Color(red: 0.54, green: 0.58, blue: 0.62))
                .multilineTextAlignment(.center)
        }
        .frame(width: 353, height: 190)
        .background(
            LinearGradient(
                colors: gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
    }
}

