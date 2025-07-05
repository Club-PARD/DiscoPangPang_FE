//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 245/255, blue: 246/255, opacity: 1).ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 8) {
                AnswerTopCell()
                    .padding(.bottom, 16)
                
                QuestionStepCell()
                
                QuestionCell(selectedIndex: .constant(0))
                    .padding(.bottom, 16)
                
                ExplainCell(selectedIndex: .constant(0))
                
                AnswerCell(selectedIndex: .constant(0))
                
                Spacer()
            }
            .padding(20)
            
            VStack {
                Spacer()
                AnswerButton()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    AnswerView()
}
