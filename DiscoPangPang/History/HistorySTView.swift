//
//  HistorySTView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistorySTView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ZStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 393, height: 240)
                      .background(
                        LinearGradient(
                          stops: [
                            Gradient.Stop(color: Color(red: 1, green: 0.69, blue: 0.08), location: 0.00),
                            Gradient.Stop(color: .white, location: 1.00),
                          ],
                          startPoint: UnitPoint(x: 0.5, y: 0),
                          endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                      )
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("전략적사고")
                              .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                              .foregroundColor(Color(red: 0.54, green: 0.36, blue: 0))
                            
                            Text("정보 분석, 통찰력 발휘에 강한 재능을 가진 테마")
                              .font(Font.custom("Pretendard", size: 13))
                              .foregroundColor(Color(red: 0.26, green: 0.17, blue: 0))
                        }
                        
                        Spacer()
                        
                        Image("giboonist")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 118, height: 111.7001953125)
                    }
                    .padding(.top, 80)
                    .padding(.leading, 20)
                }
                .frame(width: 393, height: 240)
                
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(strengthTags4.filter { $0.title != "선택안함" }) { tag in
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
    HistorySTView()
}
