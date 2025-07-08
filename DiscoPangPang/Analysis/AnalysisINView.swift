//
//  AnalysisINView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/6/25.
//

import SwiftUI

struct AnalysisINView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let tags: [TagData] = [
        TagData(title: "지휘", value: 9),
        TagData(title: "의사소통", value: 7),
        TagData(title: "행동력", value: 5),
        TagData(title: "경쟁", value: 3),
        TagData(title: "최상화", value: 1)
    ]
    
    let maxSize: CGFloat = 130
    let minSize: CGFloat = 60
    let containerSize = CGSize(width: 353, height: 570)

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 0.98)

            VStack(alignment: .leading) {
                Text("영향력")
                    .font(.pretendard(.semibold, size: 19))
                    .foregroundColor(Color(red: 0.15, green: 0.45, blue: 0.22))
                    .padding(.top, 21)
                    .padding(.bottom, 7)

                Text("화살표 형태의 삼각형은 방향 제시 및 리더십처럼\n다른 사람을 이끄는 영향력 테마를 의미해요.")
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
                            Image("Polygon 4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size, height: size)
                                .padding(.leading, 18)
                            
                            Text(tag.title)
                                .font(.pretendard(.medium, size: 11))
                                .foregroundColor(Color(red: 0.13, green: 0.53, blue: 0.22))
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
                            Gradient.Stop(color: Color(red: 0.92, green: 0.96, blue: 0.93), location: 0.50),
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
                    ZStack {
                        Image(systemName: "chevron.left")  // 커스텀 아이콘
                            .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))       // 아이콘 색상 조절
                            .font(.system(size: 16))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.clear)
                    }
                }
                .padding(.leading, -8)
            }
        }
    }
}

#Preview {
    AnalysisINView()
}
