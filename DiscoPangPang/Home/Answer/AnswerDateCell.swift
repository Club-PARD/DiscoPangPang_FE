//
//  AnswerDateCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerDateCell: View {
    
    let record: RecordDataModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("마감날짜")
                .font(.system(size: 13))
                .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
            
            HStack {
                Text("2025.07.03")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
            }  // HStack
        }  // VStack
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
        )
    }
}

#Preview {
    AnswerDateCell(record: mockRecordData)
}
