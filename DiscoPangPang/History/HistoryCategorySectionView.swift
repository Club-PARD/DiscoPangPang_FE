//
//  HistoryCategorySectionView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryCategorySectionView: View {
    let tag: StrengthTag
    let records: [(title: String, dateRange: String)]

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(tag.color)

                Text(tag.title)
                    .font(.custom("Pretendard", size: 14).weight(.semibold))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))

                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(records, id: \.title) { record in
                        HistoryRecordItemView(
                            title: record.title,
                            dateRange: record.dateRange
                        ) {
                            // 버튼 클릭 시 액션
                            print("클릭됨: \(record.title)")
                        }

                    }
                }
            }
        }
    }
}
