//
//  HistoryRFView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryRFView: View {
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
                            Gradient.Stop(color: Color(red: 0.96, green: 0.53, blue: 0.44), location: 0.00),
                            Gradient.Stop(color: .white, location: 1.00),
                          ],
                          startPoint: UnitPoint(x: 0.5, y: 0),
                          endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                      )
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("관계형성")
                              .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                              .foregroundColor(Color(red: 0.74, green: 0.17, blue: 0.06))
                            
                            Text("사람들과의 연결에 강한 재능을 가진 테마")
                              .font(Font.custom("Pretendard", size: 13))
                              .foregroundColor(Color(red: 0.36, green: 0.09, blue: 0.04))
                        }
                        
                        Spacer()
                        
                        Image("giboonirf")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 126.0005078125, height: 118.751953125)
                    }
                    .padding(.top, 80)
                    .padding(.leading, 20)
                }
                .frame(width: 393, height: 240)
                
                VStack(alignment: .leading, spacing: 40) {
                    ForEach(strengthTags3.filter { $0.title != "선택안함" }) { tag in
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
    HistoryRFView()
}
