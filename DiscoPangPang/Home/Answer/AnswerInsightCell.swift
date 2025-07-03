//
//  AnswerInsigntCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerInsightCell: View {
    
    @State var insightText: String = ""
    private let placeholder: String = "느낀점이나 새로 알게된 내용이 있으면 기록해주세요."
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("인사이트")
                .font(.system(size: 13))
                .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
            
            TextEditor(text: $insightText)
                .customStyleEditor(placeholder: placeholder, userInput: $insightText)
                .frame(height: 100)
        }  // VStack
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
        )
    }
}

#Preview {
    AnswerInsightCell()
}
