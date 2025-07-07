//
//  QuestionCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct QuestionCell: View {
    
    @Binding var selectedIndex: Int
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(questionTypes[selectedIndex].rawValue)
                .font(.system(size: 20))
                .foregroundColor(Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(questionTypes[selectedIndex].typeValues[2])
                Text(questionTypes[selectedIndex].typeValues[3])
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
            .animation(.easeInOut, value: selectedIndex)
        }
        .bold()
    }
}


#Preview {
    VStack(spacing: 20) {
        QuestionCell(selectedIndex: .constant(0))
        QuestionCell(selectedIndex: .constant(1))
        QuestionCell(selectedIndex: .constant(2))
        QuestionCell(selectedIndex: .constant(3))
        QuestionCell(selectedIndex: .constant(4))
    }
}
