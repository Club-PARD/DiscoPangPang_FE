//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    
    let record: RecordDataModel
    
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 245/255, blue: 246/255, opacity: 1).ignoresSafeArea(edges: .all)
            
            ScrollView {
                LazyVStack(spacing: 24) {
                    AnswerTopCell()
                        .border(Color.blue.opacity(0.2), width: 2)
                    
                    VStack(spacing: 16) {
                        QuestionCell()
                            .border(Color.blue.opacity(0.2), width: 2)
                        
                        AnswerInsightCell()
                            .border(Color.blue.opacity(0.2), width: 2)
                        
                        AnswerTagCell(record: mockRecordData)
                            .border(Color.blue.opacity(0.2), width: 2)
                        
                        AnswerDateCell(record: mockRecordData)
                            .border(Color.blue.opacity(0.2), width: 2)
                    }  // VStack
                }  // VStack
                .padding(EdgeInsets(top: 64, leading: 36, bottom: 36, trailing: 36))
                .border(Color.red.opacity(0.2), width: 2)
            }
            
            VStack {
                Spacer()
                AnswerButton()
            }  // VStack
            .padding(EdgeInsets(top: 0, leading: 36, bottom: 64, trailing: 36))
        }  // ZStack
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
    AnswerView(record: mockRecordData)
}
