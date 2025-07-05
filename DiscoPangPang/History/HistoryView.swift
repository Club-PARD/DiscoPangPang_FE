//
//  RecordView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                Text("히스토리")
                  .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                  .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                  .frame(width: 66, height: 19, alignment: .leading)
                
                Text("히스토리에서 과거의 경험들을 살펴보세요!")
                  .font(Font.custom("Pretendard", size: 13))
                  .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.74))
                  .padding(.bottom, 28)
                
                VStack(spacing: 24) {
                    NavigationLink(destination: HistoryEXView()) {
                        HistorySectionBox(
                            title: "실행",
                            imageName: "giboonipencil",
                            tags: "성취 · 조정자 · 신념 · 일관성\n신중함 · 규율 · 집중 · 책임 · 회복력",
                            titleColor: Color(red: 0.04, green: 0.42, blue: 0.7),
                            gradientColors: [Color.white, Color(red: 0.91, green: 0.96, blue: 1), Color.white]
                        )
                    }.buttonStyle(PlainButtonStyle())

                    NavigationLink(destination: HistoryINView()) {
                        HistorySectionBox(
                            title: "영향력",
                            imageName: "giboonimike",
                            tags: "행동력 · 지휘 · 의사소통 · 경쟁\n최상화 · 자신감 · 중요성 · 사람사귀기",
                            titleColor: Color(red: 0.15, green: 0.45, blue: 0.22),
                            gradientColors: [Color.white, Color(red: 0.92, green: 0.96, blue: 0.93), Color.white]
                        )
                    }.buttonStyle(PlainButtonStyle())

                    NavigationLink(destination: HistoryRFView()) {
                        HistorySectionBox(
                            title: "관계형성",
                            imageName: "gibooniheart",
                            tags: "적응 · 연결성 · 성장촉진자 · 공감\n조화 · 포용 · 개별화 · 긍정 · 친밀",
                            titleColor: Color(red: 0.74, green: 0.17, blue: 0.06),
                            gradientColors: [Color.white, Color(red: 0.99, green: 0.94, blue: 0.93), Color.white]
                            )
                    }.buttonStyle(PlainButtonStyle())

                    NavigationLink(destination: HistorySTView()) {
                        HistorySectionBox(
                            title: "전략적사고",
                            imageName: "gibooniglasses",
                            tags: "분석 · 맥락 · 미래지향 · 아이디어\n수집 · 사색 · 학습자 · 전략적사고",
                            titleColor: Color(red: 0.54, green: 0.36, blue: 0),
                            gradientColors: [Color.white, Color(red: 1, green: 0.95, blue: 0.86), Color.white]
                        )
                    }.buttonStyle(PlainButtonStyle())
                }

            }
            .padding(.top, 32)
            .padding(.horizontal, 20)
        }
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        .tint(.black)
    }
}

#Preview {
    HistoryView()
}
