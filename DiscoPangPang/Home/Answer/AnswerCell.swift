//
//  AnswerInsigntCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerCell: View {
    
    @State var insightText: String = ""
    
    private let placeholder: String = "ex) 한동대학교 IT 협업 동아리 PARD 5기 롱커톤에서, 기획·디자인·iOS·서버 개발자 등 총 5명이 한 팀을 이뤄 3주 동안 ‘기분’ 앱 서비스를 기획·제작했어요."
    
    var body: some View {
        TextEditor(text: $insightText)
            .customStyleEditor(placeholder: placeholder, userInput: $insightText)
            .frame(height: 268)
    }
}

#Preview {
    AnswerCell()
}
