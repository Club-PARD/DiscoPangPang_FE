//
//  AnalysisEXView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/6/25.
//

import SwiftUI

struct TagData: Identifiable {
    let id = UUID()
    let title: String
    let value: Int
}

struct AnalysisEXView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let tags: [TagData] = [
        TagData(title: "집중", value: 9),
        TagData(title: "일관성", value: 7),
        TagData(title: "집중", value: 5),
        TagData(title: "성취", value: 3),
        TagData(title: "규율", value: 1)
    ]
    
    let maxSize: CGFloat = 130
    let minSize: CGFloat = 60
    let containerSize = CGSize(width: 353, height: 570)

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 0.98)

            VStack(alignment: .leading) {
                Text("실행")
                    .font(.pretendard(.semibold, size: 19))
                    .foregroundColor(Color(red: 0.04, green: 0.42, blue: 0.7))
                    .padding(.top, 21)
                    .padding(.bottom, 7)

                Text("사각형은 4개의 변이 이루는 견고한 구조처럼\n체계적으로 임무를 완수하는 실행 테마를 의미해요.")
                    .font(.pretendard(.regular, size: 13))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                    .padding(.bottom, 21)

                ZStack {
                    let sorted = tags.sorted { $0.value > $1.value }
                    let maxValue = CGFloat(sorted.first?.value ?? 100)
                    
                    ForEach(Array(sorted.enumerated()), id: \.element.id) { index, tag in
                        let ratio = CGFloat(tag.value) / maxValue
                        let size = minSize + (maxSize - minSize) * ratio

                        // 정해진 위치 목록
                        let positions: [CGPoint] = [
                            CGPoint(x: containerSize.width / 2, y: containerSize.height / 2), // center
                            CGPoint(x: containerSize.width * 0.25, y: containerSize.height * 0.25),
                            CGPoint(x: containerSize.width * 0.75, y: containerSize.height * 0.75),
                            CGPoint(x: containerSize.width * 0.25, y: containerSize.height * 0.75),
                            CGPoint(x: containerSize.width * 0.75, y: containerSize.height * 0.25)
                        ]
                        
                        let pos = positions[index]

                        VStack {
                            Text(tag.title)
                                .font(.pretendard(.medium, size: 11))
                                .foregroundColor(Color(red: 0.04, green: 0.47, blue: 0.8))
                        }
                        .frame(width: size, height: size)
                        .background(
                            EllipticalGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.37, green: 0.71, blue: 0.97), location: 1.00),
                                ],
                                center: UnitPoint(x: 0.5, y: 0.5)
                                )
                            )
                        .cornerRadius(6)
                        .shadow(color: .black.opacity(0.12), radius: 16 / 2, x: 0, y: 8)
                        .shadow(color: .black.opacity(0.08), radius: 1, x: 0, y: 0)
                        .position(pos)
                    }
                }
                .frame(width: containerSize.width, height: containerSize.height)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .white, location: 0.00),
                            Gradient.Stop(color: Color(red: 0.91, green: 0.96, blue: 1), location: 0.50),
                            Gradient.Stop(color: .white, location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                )
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
            }
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true) // 기본 백버튼 숨기기
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 뒤로가기 동작
                }) {
                    Image(systemName: "chevron.left")  // 커스텀 아이콘
                        .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))       // 아이콘 색상 조절
                        .frame(width: 9, height: 15)
                }
            }
        }
    }
}


#Preview {
    AnalysisEXView()
}
