//
//  RecordCel.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct RecordCell: View {
    let today = Date()
    let record: RecordDataModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack(alignment: .center) {
                Text("\(record.dueDate)")
                    .font(Font.custom("Pretendard", size: 13))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                
                Spacer()
                
                Button(action: {
                    print("버튼 눌림")
                }){
                    Image("more")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .center)
            
            VStack(alignment: .leading, spacing: 8) {
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
                }
                .padding(0)
                
                Text("\(record.title)")
                  .font(
                    Font.custom("Pretendard", size: 19)
                      .weight(.bold)
                  )
                  .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            VStack(alignment: .trailing, spacing: 16) {
                //if record.dueDate > today {
                    Text("경험 기록하기")
                        .font(
                            Font.custom("Pretendard", size: 13)
                                .weight(.bold)
                        )
                        .foregroundColor(Color.white)
                        .padding(8)
                        .background(Color(red: 0.24, green: 0.69, blue: 0.69))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
                        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 0)
                //} else {
//                    Text("인사이트 기록하기")
//                        .font(
//                            Font.custom("Pretendard", size: 13)
//                                .weight(.bold)
//                        )
//                        .foregroundColor(Color.white)
//                        .padding(8)
//                        .background(Color(red: 1, green: 0.6, blue: 0.46))
//                        .cornerRadius(16)
//                        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
//                        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 0)
                //}
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(16)
        .frame(width: 361, alignment: .topTrailing)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
        .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 0)
    }
}

#Preview {
    RecordCell(record: mockRecordData)
}
