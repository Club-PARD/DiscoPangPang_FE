//
//  AnswerButton.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerButton: View {
    @EnvironmentObject var experienceData: ExperienceData
    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    @Binding var navigationPath: NavigationPath
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]

    var body: some View {
        Button(action: {
            if answerText[selectedIndex] != "" {
                if selectedIndex < 4 {
                    selectedIndex += 1
                } else {
                    print("finish")
                    Task {
                        if let projectId = experienceData.project?.projectId {
                            let starl = STARLModel(
                                s: answerText[0],
                                t: answerText[1],
                                a: answerText[2],
                                r: answerText[3],
                                l: answerText[4]
                            )
                            await updateSTARL(projectId: projectId, data: starl)
                            
                            await MainActor.run {
                                answerText = ["", "", "", "", ""]
                                selectedIndex = 0
                                navigationPath.removeLast()
                            }
                        } else {
                            print("❌ projectId가 없습니다")
                        }
                    }
                }
            }
        }, label: {
            HStack {
                Spacer()
                
                Text(selectedIndex == 4 ? "경험완료" : "다음 질문")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(height: 68)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(answerText[selectedIndex] == ""
                          ? Color(red: 195/255, green: 195/255, blue: 195/255, opacity: 1)
                          : Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
            )
        })
    }
}

struct PreviousButton: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            selectedIndex -= 1
        }, label: {
            HStack {
                Spacer()
                
                Text("이전 질문")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(red: 195/255, green: 195/255, blue: 195/255, opacity: 1))
                
                Spacer()
            }  // HStack
            .frame(height: 68)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 236/255, green: 236/255, blue: 238/255, opacity: 1))
            )
        })
    }
}

func updateSTARL(projectId: UUID, data: STARLModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/star/\(projectId)") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 새로운 데이터 생성
    let newSTARL = STARLModel(s: data.s, t: data.t, a: data.a, r: data.r, l: data.l)
    
    // 3. get이 아닌 경우 URLRequest 객체 생성하기
    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
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
//    AnswerButton(answerText: "dd")
//}
