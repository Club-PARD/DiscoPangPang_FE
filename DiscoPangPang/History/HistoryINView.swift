//
//  HistoryINView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/5/25.
//

import SwiftUI

struct HistoryINView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var projectGroups: [ProjectTagGroup] = []
    
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
                
                ForEach(strengthTags2.filter { $0.title != "선택안함" }, id: \.title) { tag in
                    if let group = projectGroups.first(where: { $0.labelName == tag.title }) {
                        let records: [(title: String, dateRange: String)] = group.projects.map {
                            (
                                title: $0.projectName,
                                dateRange: formatDateRange(start: $0.startDateTime, end: $0.endDateTime)
                            )
                        }

                        HistoryCategorySectionView(tag: tag, records: records)
                            .padding(.horizontal, 20)
                    }
                }
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
                    ZStack {
                        Image(systemName: "chevron.left")  // 커스텀 아이콘
                            .foregroundColor(Color(red: 0.35, green: 0.38, blue: 0.42))       // 아이콘 색상 조절
                            .font(.system(size: 16))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.clear)
                    }
                }
                .padding(.leading, -12)
            }
        }
        .task {
            do {
                projectGroups = try await getHistory()
            } catch {
                print("❌ 프로젝트 불러오기 실패: \(error)")
            }
        }
    }
    
    func formatDateRange(start: String, end: String) -> String {
        // 1. 파싱용 DateFormatter
        let parser = DateFormatter()
        parser.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"  // 서버에서 오는 형식
        parser.timeZone = .current  // 또는 UTC

        // 2. 출력용 DateFormatter
        let display = DateFormatter()
        display.dateFormat = "yyyy.MM.dd"
        display.timeZone = .current

        if let startDate = parser.date(from: start),
           let endDate = parser.date(from: end) {
            return "\(display.string(from: startDate)) - \(display.string(from: endDate))"
        } else {
            print("❌ 날짜 파싱 실패: \(start), \(end)")
            return "날짜 오류"
        }
    }
}

private func getHistory() async throws -> [ProjectTagGroup] {
    
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/api/project-tag/grouped-projects?category=영향력") else {
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
        // UserModel의 배열 형태로 디코딩하여 결과값 반환
        let data = try JSONDecoder().decode([ProjectTagGroup].self, from: data)
        print(data)
        print("✅ Load Successful!")
        
        return data
    } catch {
        print("❌ Load Error: \(error)")
        throw ErrorType.networkError
    }
}

#Preview {
    HistoryINView()
}
