//
//  AddTag4VIew.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct AddTag4View: View {
    @EnvironmentObject var experienceData: ExperienceData
    @Binding var path: NavigationPath
    @Binding var tabSelection: Int
    @State private var selectedTagTitle: String? = nil
    
    var isButtonActive: Bool {
        selectedTagTitle != nil
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("전략적사고테마")
                        .font(.pretendard(.semibold, size: 15))
                        .foregroundColor(Color(red: 1, green: 0.69, blue: 0.08))
                        .padding(.bottom, 2)
                    
                    Text("정보 수집, 분석, 통찰력 발휘에 강한 재능을 가진 테마")
                        .font(.pretendard(.regular, size: 13))
                        .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.74))
                        .padding(.bottom, 40)
                    
                    VStack(spacing: 8) {
                        ForEach(strengthTags4) { tag in
                            VStack(spacing: 8){
                                Button(action: {
                                    selectedTagTitle = tag.title
                                }) {
                                    HStack {
                                        Circle()
                                            .frame(width: 8, height: 8)
                                            .foregroundColor(tag.color)
                                        
                                        Text(tag.title)
                                            .font(.pretendard(.semibold, size: 13))
                                            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                                        
                                        Text(tag.description)
                                            .font(.pretendard(.medium, size: 10))
                                            .foregroundColor(Color(red: 0.69, green: 0.72, blue: 0.75))
                                    }
                                    .padding(.vertical, 16)
                                    .padding(.leading, 16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(selectedTagTitle == tag.title ? Color(red: 1, green: 0.6, blue: 0.46).opacity(0.3) : Color.clear)
                                    .cornerRadius(8)
                                }
                                
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 120) // 하단 버튼 높이 고려
            }
            
            // 하단 고정 버튼
            VStack(spacing: 0) {
                HStack(spacing: 13) {
                    Button(action: {
                        path.removeLast()
                    }) {
                        Text("이전")
                            .font(.pretendard(.bold, size: 15))
                            .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76))
                            .frame(maxWidth: .infinity, maxHeight: 68)
                            .background(Color(red: 0.93, green: 0.92, blue: 0.93))
                            .cornerRadius(16)
                    }
                    
                    Button(action: {
                        if var tagModel = experienceData.tags {
                            // 기존 라벨 배열에 현재 선택된 라벨을 추가 또는 덮어쓰기
                            tagModel.labels.removeAll { $0.labelCategory == "전략적사고" }
                            if let selected = selectedTagTitle {
                                tagModel.labels.append(LabelData(labelName: selected, labelCategory: "전략적사고"))
                            }

//                            tagModel.projectId = experienceData.project?.projectId.uuidString ?? ""
                            experienceData.tags = tagModel

                        } else {
                            // tags가 nil일 경우 새로 생성
                            let newLabel = LabelData(labelName: selectedTagTitle ?? "", labelCategory: "전략적사고")
                            let newTagModel = TagModel(
                                projectId: experienceData.project?.projectId.uuidString ?? "",
                                labels: [newLabel]
                            )
                            experienceData.tags = newTagModel
                        }

                        let testDeadline = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
                        scheduleDeadlineNotification(deadline: testDeadline, title: "")
                        //scheduleDeadlineNotification(deadline: experienceData.endDate, title: experienceData.title)
                        
                           // ✅ 서버에 업로드 (비동기 실행)
                        Task {
                            if let project = experienceData.project {
                                await postProject(data: project)
                            }
                            if let tags = experienceData.tags {
                                await postTag(data: tags)
                            }
                            
                            
                            experienceData.reset()
                            path.removeLast(path.count)
                            tabSelection = 0
                        }
                    }) {
                        Text("경험 생성")
                            .font(.pretendard(.bold, size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 68)
                            .background(
                                isButtonActive
                                    ? Color(red: 1, green: 0.6, blue: 0.46)
                                    : Color(red: 0.76, green: 0.76, blue: 0.76)
                            )
                            .cornerRadius(16)
                    }
                    .disabled(!isButtonActive)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.white)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .padding(.top, 40)
        .padding(.bottom, 20)
        .ignoresSafeArea(edges: .bottom)
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle("경험 추가")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    experienceData.reset()
                    path.removeLast(path.count) // 네비게이션 스택 초기화
                    tabSelection = 0            // 홈 탭으로 이동
                }) {
                    ZStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.clear)
                    }
                }
                .padding(.trailing, 4)
            }
        }
    }
}

private func postProject(_ userId: Int = 8, data: ProjectModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/project/\(userId)") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 새로운 데이터 생성
    let newProject = ProjectModel(projectId: data.projectId, projectName: data.projectName, endDateTime: data.endDateTime, startDateTime: data.startDateTime)

    
    // 3. get이 아닌 경우 URLRequest 객체 생성하기
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
    
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    
    do {
        let bodyData = try encoder.encode(newProject)
        print("🔸보낼 JSON: \(String(data: bodyData, encoding: .utf8) ?? "")")
        request.httpBody = try encoder.encode(newProject)
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

private func postTag(data: TagModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/label/project/tag") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 새로운 데이터 생성
    let newTag = TagModel(projectId: data.projectId, labels: data.labels)
    
    // 3. get이 아닌 경우 URLRequest 객체 생성하기
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let bodyData = try JSONEncoder().encode(newTag)
        print("🔸보낼 JSON: \(String(data: bodyData, encoding: .utf8) ?? "")")
        request.httpBody = try JSONEncoder().encode(newTag)
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

#Preview {
    AddTag4View(path: .constant(NavigationPath()), tabSelection: .constant(0))
        .environmentObject(ExperienceData())
}
