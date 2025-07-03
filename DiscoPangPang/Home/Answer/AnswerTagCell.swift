//
//  AnswerTagView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerTagCell: View {
    
    let record: RecordDataModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("태그")
                .font(.system(size: 13))
                .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
            
            HStack(alignment: .top, spacing: 8) {
                ForEach(0..<record.tag.count, id: \.self){ index in
                    Text("\(record.tag[index])")
                        .font(Font.custom("Pretendard", size: 13))
                        .kerning(0.4)
                        .foregroundColor(Color(red: 0.96, green: 0.53, blue: 0.44))
                        .padding(4)
                        .background(Color(red: 0.99, green: 0.94, blue: 0.93))
                        .cornerRadius(8)
                }
                
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
    AnswerTagCell(record: mockRecordData)
}
