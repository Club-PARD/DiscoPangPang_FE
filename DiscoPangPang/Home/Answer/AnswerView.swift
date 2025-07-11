//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    
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
            
//            if isShowTempSaveAlert {
//                TemporarySaveAlert()
//                    .padding(.horizontal, 20)
//                    .offset(y: 225)
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            isShowTempSaveAlert = false
//                        }
//                    }
//            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

private func postSTARL(projectId: UUID, data: STARLModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/star/\(projectId)") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 새로운 데이터 생성
    let newSTARL = STARLModel(s: data.s, t: data.t, a: data.a, r: data.r, l: data.l, projectId: data.projectId)
    
    // 3. get이 아닌 경우 URLRequest 객체 생성하기
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let bodyData = try JSONEncoder().encode(newSTARL)
        print("🔸보낼 JSON: \(String(data: bodyData, encoding: .utf8) ?? "")")
        request.httpBody = try JSONEncoder().encode(newSTARL)
    } catch {
        print("❌ Encoding Error: \(error)")
        return
    }
    
    // 4. URLSession 구성 및 URLSession Task 만든 후 네트워크 요청
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
        
        // 서버로부터 데이터를 받아오는데 실패하면 error를 던지고 함수 종료
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("❌ Response Error: \(response)")
            return
        }
        
        print("✅ Post Successful!")
    } catch {
        print("❌ Network Error: \(error)")
    }
}


//#Preview {
//    AnswerView(navigationPath: $navigationPath, answerText: $answerText)
//}
