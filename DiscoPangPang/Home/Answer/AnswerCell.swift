//
//  AnswerInsigntCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerCell: View {
    
    @Binding var AnswerText: String
//    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]
    
    var body: some View {
        let placeholder = questionTypes[selectedIndex].typeValues[5]
        
        TextEditor(text: $AnswerText)
            .customStyleEditor(placeholder: placeholder, userInput: $AnswerText)
            .frame(height: 268)
    }
}

//#Preview {
//    AnswerCell(selectedIndex: .constant(0))
//}
