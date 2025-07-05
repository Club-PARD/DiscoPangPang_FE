//
//  HistoryRecordItemView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryRecordItemView: View {
    let title: String
    let dateRange: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Pretendard", size: 12).weight(.semibold))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                
                Spacer()
                
                Text(dateRange)
                    .font(.custom("Pretendard", size: 10))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
            }
            .padding(16)
            .frame(width: 160, height: 80, alignment: .leading)
            .background(Color(red: 1, green: 0.97, blue: 0.96))
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}
