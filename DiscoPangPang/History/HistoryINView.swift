//
//  HistoryINView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryINView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .background(
                        LinearGradient(
                          stops: [
                            Gradient.Stop(color: .white, location: 0.00),
                            Gradient.Stop(color: Color(red: 0.49, green: 0.78, blue: 0.56), location: 1.00),
                          ],
                          startPoint: UnitPoint(x: 0.5, y: 1),
                          endPoint: UnitPoint(x: 0.5, y: 0)
                        )
                      )
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("영향력")
                              .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                              .foregroundColor(Color(red: 0.15, green: 0.45, blue: 0.22))
                            
                            Text("사람들을 이끌고 설득하는 능력이 강한 테마")
                              .font(Font.custom("Pretendard", size: 13))
                              .foregroundColor(Color(red: 0.12, green: 0.28, blue: 0.15))
                        }
                        
                        Spacer()
                        
                        Image("gibooniin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 126, height: 111.7001953125)
                    }
                    .padding(.top, 80)
                    .padding(.leading, 20)
                }
                .frame(width: 393, height: 240)
                
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(strengthTags2.filter { $0.title != "선택안함" }) { tag in
                        HistoryCategorySectionView(
                            tag: tag,
                            records: [
                                ("해커톤", "2025.05.04 - 2025.05.06"),
                                ("봉사활동", "2025.01.10 - 2025.01.12")
                            ]
                        )
                    }
                }
                .padding(.leading, 20)
            }
        }
        .ignoresSafeArea(.all)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true) // 기본 백버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 뒤로가기 동작
                }) {
                    Image(systemName: "chevron.left")  // 커스텀 아이콘
                        .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.42))       // 아이콘 색상 조절
                        .frame(width: 9, height: 15)
                }
            }
        }
    }
}

#Preview {
    HistoryINView()
}
