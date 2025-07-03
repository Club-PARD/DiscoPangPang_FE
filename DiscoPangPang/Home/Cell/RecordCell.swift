//
//  RecordCel.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct RecordCell: View {
    @State private var isshowModal = false
    let today = Date()
    let record: RecordDataModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack(alignment: .center) {
                Text("\(record.dueDate)")
                    .font(Font.custom("Pretendard", size: 13))
                    .foregroundColor(Color(red: 0.53, green: 0.56, blue: 0.59))
                
                Spacer()
                
                Button(action: {
                    print("버튼 눌림")
                    isshowModal = true
                }){
                    Image("more")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            } //HStack
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(record.title)")
                  .font(
                    Font.custom("Pretendard", size: 19)
                      .weight(.semibold)
                  )
                  .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                
                HStack(alignment: .top, spacing: 4) {
                    ForEach(0..<record.tag.count, id: \.self){ index in
                        ZStack {
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 37, height: 27)
                              .background(Color(red: 0.99, green: 0.94, blue: 0.93))
                              .cornerRadius(8)
                            
                            Text("\(record.tag[index])")
                                .font(
                                    Font.custom("Pretendard", size: 11)
                                        .weight(.semibold)
                                )
                                .kerning(0.4)
                                .foregroundColor(Color(red: 0.96, green: 0.53, blue: 0.44))
                                .padding(4)
                                .background(Color(red: 0.99, green: 0.94, blue: 0.93))
                                .cornerRadius(8)
                        }
                    }
                } //HStack
            } //VStack
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            ZStack {
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 95, height: 42)
                  .background(Color(red: 1, green: 0.6, blue: 0.46))
                  .cornerRadius(12)
                
                Text("경험 기록하기")
                    .font(
                        Font.custom("Pretendard", size: 12)
                            .weight(.bold)
                    )
                    .foregroundColor(Color.white)
                    .padding(8)
            } //ZStack
        } //VStack
        .padding(15)
        .foregroundColor(.clear)
        .frame(width: 353, height: 189)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
        .sheet(isPresented: $isshowModal) {
            ModalView {
                isshowModal = false
            }
            .presentationDetents([.height(136)])
            .presentationDragIndicator(.hidden)
        }
    }
}

#Preview {
    RecordCell(record: mockRecordData)
}
