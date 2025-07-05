//
//  HistorySectionData.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct HistorySectionData: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let tags: String
    let titleColor: Color
    let gradientColors: [Color]
}

let historySections: [HistorySectionData] = [
    HistorySectionData(
        title: "실행 히스토리",
        imageName: "giboonipencil",
        tags: "성취 · 조정자 · 신념 · 일관성\n신중함 · 규율 · 집중 · 책임 · 회복력",
        titleColor: Color(red: 0.04, green: 0.42, blue: 0.7),
        gradientColors: [.white, Color(red: 0.91, green: 0.96, blue: 1), .white]
    ),
    HistorySectionData(
        title: "영향력 히스토리",
        imageName: "giboonimike",
        tags: "행동력 · 지휘 · 의사소통 · 경쟁\n최상화 · 자신감 · 중요성 · 사람사귀기",
        titleColor: Color(red: 0.15, green: 0.45, blue: 0.22),
        gradientColors: [.white, Color(red: 0.92, green: 0.96, blue: 0.93), .white]
    ),
    HistorySectionData(
        title: "관계형성 히스토리",
        imageName: "gibooniheart",
        tags: "적응 · 연결성 · 성장촉진자 · 공감\n조화 · 포용 · 개별화 · 긍정 · 친밀",
        titleColor: Color(red: 0.74, green: 0.17, blue: 0.06),
        gradientColors: [.white, Color(red: 0.99, green: 0.94, blue: 0.93), .white]
    ),
    HistorySectionData(
        title: "전략적사고 히스토리",
        imageName: "gibooniglasses",
        tags: "분석 · 맥락 · 미래지향 · 아이디어\n수집 · 사색 · 학습자 · 전략적사고",
        titleColor: Color(red: 0.54, green: 0.36, blue: 0),
        gradientColors: [.white, Color(red: 1, green: 0.95, blue: 0.86), .white]
    )
]
