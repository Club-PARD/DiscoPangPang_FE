//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject var experienceData: ExperienceData
    @State var isShowCancelAlert: Bool = false
    @Binding var isShowTempSaveAlert: Bool
    
    @Binding var navigationPath: NavigationPath
    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 245/255, blue: 246/255, opacity: 1).ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 8) {
                AnswerTopCell(isShowCancelAlert: $isShowCancelAlert,
                              isShowTempsaveAlert: $isShowTempSaveAlert,
                              navigationPath: $navigationPath)
                    .padding(EdgeInsets(top: 0, leading: -12, bottom: 16, trailing: 0))
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        QuestionStepCell(selectedIndex: $selectedIndex)
                        
                        QuestionCell(selectedIndex: $selectedIndex)
                            .padding(.bottom, 16)
                        
                        ExplainCell(selectedIndex: $selectedIndex)
                        
                        AnswerCell(AnswerText: $answerText[selectedIndex], selectedIndex: $selectedIndex)
                    }
                }
                .scrollDismissesKeyboard(.interactively)
                
                Spacer()
            }
            .padding(20)
            
            VStack {
                Spacer()
                
                if selectedIndex == 0 {
                    AnswerButton(answerText: $answerText, selectedIndex: $selectedIndex, navigationPath: $navigationPath)
                } else {
                    HStack(spacing: 12) {
                        PreviousButton(selectedIndex: $selectedIndex)
                        AnswerButton(answerText: $answerText, selectedIndex: $selectedIndex, navigationPath: $navigationPath)
                    }
                }
            }
            .padding()
            
            if isShowCancelAlert {
                Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.32).edgesIgnoringSafeArea(.all)
                CancelAlert(isShowCancelAlert: $isShowCancelAlert, navigationPath: $navigationPath)
                    .padding(.horizontal, 20)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                guard let projectId = experienceData.project?.projectId else {
                    print("❌ projectId가 없습니다.")
                    return
                }
                do {
                    let savedSTARL = try await getSTARL(projectId: projectId)
                    await MainActor.run {
                        answerText = [savedSTARL.s, savedSTARL.t, savedSTARL.a, savedSTARL.r, savedSTARL.l]
                        selectedIndex = 0
                        print("✅ STARL 데이터 로드 성공: \(answerText)")
                    }
                } catch {
                    print("❌ STARL 데이터 로드 실패: \(error)")
                }
            }
        }
    }
}

func getSTARL(projectId: UUID) async throws -> STARLModel {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/star/\(projectId)") else {
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
        let data = try JSONDecoder().decode(STARLModel.self, from: data)
        print(data)
        print("✅ Load Successful!")
        
        return data
    } catch {
        print("❌ Load Error: \(error)")
        throw ErrorType.networkError
    }
}

//#Preview {
//    AnswerView(navigationPath: $navigationPath, answerText: $answerText)
//}
