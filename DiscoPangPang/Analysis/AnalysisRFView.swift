//
//  AnalysisRFView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/6/25.
//

import SwiftUI

struct AnalysisRFView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var tags: [TagData] = []
    
    let maxSize: CGFloat = 130
    let minSize: CGFloat = 60
    let containerSize = CGSize(width: 353, height: 570)

    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 0.98)

            VStack(alignment: .leading) {
                Text("관계형성")
                    .font(.pretendard(.semibold, size: 19))
                    .foregroundColor(Color(red: 0.74, green: 0.17, blue: 0.06))
                    .padding(.top, 21)
                    .padding(.bottom, 7)

                Text("원은 연결성과 포용력처럼\n사람과 사람을 이어주는 관계형성 테마를 의미해요.")
                    .font(.pretendard(.regular, size: 13))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                    .padding(.bottom, 21)

                ZStack {
                    let sorted = tags.sorted { $0.value > $1.value }.prefix(5)
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
                            Image("Ellipse 26")
                                .resizable()
                                .scaledToFit()
                                .frame(width: size, height: size)
                            
                            Text(tag.title)
                                .font(.pretendard(.medium, size: 11))
                                .foregroundColor(Color(red: 0.87, green: 0.2, blue: 0.07))
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
                            Gradient.Stop(color: Color(red: 0.99, green: 0.94, blue: 0.93), location: 0.50),
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
        .task {
            do {
                let loadedTags = try await getAnalysis()
                tags = loadedTags
            } catch {
                print("❌ 데이터 로딩 실패: \(error)")
            }
        }
    }
}

private func getAnalysis() async throws -> [TagData] {
    
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/api/project-tag/label-count/by-category?userId=8&category=관계형성") else {
        throw ErrorType.invalidURL
    }
    
    // 2. URLSession 구성 및 URLSession Task 만든 후 task 요청
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // 서버로부터 데이터를 받아오는데 실패하면 error를 던지고 함수 종료
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw ErrorType.invalidResponse
    }
    
    // 데이터를 성공적으로 받아왔을 경우 do-catch문 실행
    do {
        let rawDict = try JSONDecoder().decode([String: Int].self, from: data)
        // UserModel의 배열 형태로 디코딩하여 결과값 반환
        let data = rawDict.map { TagData(title: $0.key, value: $0.value) }
        //let data = try JSONDecoder().decode([TagData].self, from: data)
        print(data)
        print("✅ Load Successful!")
        
        return data
    } catch {
        print("❌ Load Error: \(error)")
        throw ErrorType.networkError
    }
}

#Preview {
    AnalysisRFView()
}
