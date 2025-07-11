//
//  HistoryCategorySectionView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryCategorySectionView: View {
    let tag: StrengthTag
    let records: [(project: Project, title: String, dateRange: String)]
    
    @State private var selectedProject: Project? = nil
    @State private var isNavigatingToAnswer = false

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
                            selectedProject = record.project
                            isNavigatingToAnswer = true
                        }

                    }
                }
            }
            
            NavigationLink(
                destination: selectedProject.map { HistoryAnswerView(project: $0) },
                isActive: $isNavigatingToAnswer
            ) {
                EmptyView()
            }
            .hidden()

        }
    }
}
