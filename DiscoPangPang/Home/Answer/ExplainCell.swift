//
//  ExplainCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/4/25.
//

import SwiftUI

struct ExplainCell: View {
    @Binding var selectedIndex: Int
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]
    
    var body: some View {
        Text(questionTypes[selectedIndex].typeValues[4])
            .font(.pretendard(.light, size: 11))
            .foregroundColor(Color(red: 146/255, green: 146/255, blue: 146/255, opacity: 1))
            .animation(.easeInOut, value: selectedIndex)
    }
}

#Preview {
    VStack {
        ExplainCell(selectedIndex: .constant(0))
        ExplainCell(selectedIndex: .constant(1))
        ExplainCell(selectedIndex: .constant(2))
        ExplainCell(selectedIndex: .constant(3))
        ExplainCell(selectedIndex: .constant(4))
    }
}
