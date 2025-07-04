//
//  AddTagView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct TagButton: View {
    let category: String
    let tag: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void

    var body: some View {
        Text(tag)
            .font(Font.custom("Pretendard", size: 15))
            .foregroundColor(isSelected ? color : Color(red: 0.8, green: 0.82, blue: 0.84))
            .padding(8)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? color : Color(red: 0.8, green: 0.82, blue: 0.84), lineWidth: 1)
            )
            .onTapGesture {
                action()
            }
    }
}

struct AddTagView: View {
    @Binding var path: NavigationPath
    
    @State private var selectedTags: [String: Set<String>] = [:]
    
    let categoryTags: [String: [String]] = [
        "실행": ["성취", "조정자", "신념", "일관성", "신중함", "규율", "집중", "책임", "회복력"],
        "영향력": ["행동력", "지휘", "의사소통", "경쟁", "최상화", "자신감", "중요성", "사람사귀기"],
        "관계 형성": ["적응", "연결성", "성장촉진자", "공감", "조화", "포용", "개별화", "긍정", "친밀"],
        "전략적 사고": ["분석", "맥락", "미래지향", "아이디어", "수집", "사색", "학습자", "전략적사고"]
    ]
        
    let categoryColors: [String: Color] = [
        "실행": Color(red: 0.37, green: 0.71, blue: 0.97),
        "영향력": Color(red: 0.49, green: 0.78, blue: 0.56),
        "관계 형성": Color(red: 0.96, green: 0.53, blue: 0.44),
        "전략적 사고": Color(red: 1, green: 0.69, blue: 0.08)
    ]
    
    let firstLineTagCounts: [String: Int] = [
        "실행": 5,
        "영향력": 4,
        "관계 형성": 4,
        "전략적 사고": 4
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("태그")
                .font(Font.custom("Pretendard", size: 15))
                .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 32)
            
            ForEach(categoryTags.keys.sorted(), id: \.self) { category in
                categoryView(category: category, firstLineCount: firstLineTagCounts[category] ?? 4)
                    .padding(.horizontal, 16)
                    .frame(width: 361, alignment: .topLeading)
            }
            
            Button(action: {
                print("선택된 태그: \(selectedTags)")
            }) {
                HStack {
                    Text("완료")
                        .font(
                            Font.custom("Pretendard", size: 17)
                                .weight(.bold)
                        )
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 144)
                .padding(.vertical, 8)
                .frame(width: 320, alignment: .center)
                .background(Color(red: 0.04, green: 0.61, blue: 0.61))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 0)
            }
            .padding(.top, 29)
        } //VStack
        .padding(.top, 126)
        .padding(.bottom, 40)
    }
    
    @ViewBuilder
    func categoryView(category: String, firstLineCount: Int) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(category)
                .font(Font.custom("Pretendard", size: 15))
                .foregroundColor(.black)
                
            let tags = categoryTags[category] ?? []
            let firstLineTags = Array(tags.prefix(firstLineCount))
            let secondLineTags = Array(tags.dropFirst(firstLineCount))
                
            HStack(alignment: .top, spacing: 16) {
                ForEach(firstLineTags, id: \.self) { tag in
                    TagButton(
                        category: category,
                        tag: tag,
                        isSelected: selectedTags[category]?.contains(tag) ?? false,
                        color: categoryColors[category] ?? .gray
                    ) {
                        toggleTagSelection(category: category, tag: tag)
                    }
                }
            }
            .frame(width: 320, alignment: .topLeading)
                
            HStack(alignment: .top, spacing: 16) {
                ForEach(secondLineTags, id: \.self) { tag in
                    TagButton(
                        category: category,
                        tag: tag,
                        isSelected: selectedTags[category]?.contains(tag) ?? false,
                        color: categoryColors[category] ?? .gray
                    ) {
                        toggleTagSelection(category: category, tag: tag)
                    }
                }
            }
            .frame(width: 320, alignment: .topLeading)
        }
    }
        
    // 태그 선택 토글 함수
    func toggleTagSelection(category: String, tag: String) {
        if selectedTags[category]?.contains(tag) == true {
            selectedTags[category]?.remove(tag)
        } else {
            selectedTags[category, default: []].insert(tag)
        }
    }
}

#Preview {
    AddTagView(path: .constant(NavigationPath()))
}
