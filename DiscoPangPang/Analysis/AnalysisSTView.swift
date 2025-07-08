//
//  AnalysisSTView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/6/25.
//

import SwiftUI

struct AnalysisSTView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let tags: [TagData] = [
        TagData(title: "맥락", value: 9),
        TagData(title: "아이디어", value: 7),
        TagData(title: "수집", value: 5),
        TagData(title: "분석", value: 3),
        TagData(title: "사색", value: 1)
    ]
    
    let maxSize: CGFloat = 130
    let minSize: CGFloat = 60
    let containerSize = CGSize(width: 353, height: 570)

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 0.98)

            VStack(alignment: .leading) {
                Text("전략적사고")
                    .font(.pretendard(.semibold, size: 19))
                    .foregroundColor(Color(red: 0.54, green: 0.36, blue: 0))
                    .padding(.top, 21)
                    .padding(.bottom, 7)

                Text("마름모는 인사이트 및 통찰력처럼\n여러 각도에서 문제를 바라보는 전략적사고 테마를 의미해요.")
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

                        ZStack(alignment: .center) {
                            EllipticalGradient(
                                stops: [
                                    .init(color: .white, location: 0),
                                    .init(color: Color(red: 1, green: 0.69, blue: 0.08), location: 1)
                                ],
                                center: .center
                            )
                            .frame(width: size, height: size)
                            .cornerRadius(8)
                            .rotationEffect(.degrees(45))
                            
                            Text(tag.title)
                                .font(.pretendard(.medium, size: 11))
                                .foregroundColor(Color(red: 0.62, green: 0.42, blue: 0))
                        }
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
                            Gradient.Stop(color: Color(red: 1, green: 0.95, blue: 0.86), location: 0.50),
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
    AnalysisSTView()
}
