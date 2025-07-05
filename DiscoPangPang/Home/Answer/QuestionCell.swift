//
//  QuestionCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct QuestionCell: View {
    
    @State var question: String = ""
    
//    var type: QuestionType = .question1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("01")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("이 활동은 어떤 상황에서")
                Text("시작하게 되었나요?")
            }
            .font(.system(size: 20))
            .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
        }
        .bold()
    }
}


#Preview {
    QuestionCell()
}
