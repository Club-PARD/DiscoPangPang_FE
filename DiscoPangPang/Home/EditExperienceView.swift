//
//  EditExperienceView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/10/25.
//

import SwiftUI

struct EditExperienceView: View {
    @EnvironmentObject var experienceData: ExperienceData
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    
    var title: Binding<String> { $experienceData.title }
    var startDate: Binding<Date> { $experienceData.startDate }
    var endDate: Binding<Date> { $experienceData.endDate }
    var hasSelectedStartDate: Binding<Bool> { $experienceData.hasSelectedStartDate }
    var hasSelectedEndDate: Binding<Bool> { $experienceData.hasSelectedEndDate }
    
    var isButtonActive: Bool {
        !title.wrappedValue.isEmpty &&
        hasSelectedStartDate.wrappedValue &&
        hasSelectedEndDate.wrappedValue
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 45){
            VStack(alignment: .leading, spacing: 8) {
                Text("제목")
                    .font(.pretendard(.medium, size: 15))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                            
                TextField("경험의 제목을 입력해 주세요.", text: title)
                    .font(.pretendard(.regular, size: 13))
                    .foregroundColor(title.wrappedValue.isEmpty ? Color(red: 0.71, green: 0.73, blue: 0.74) : Color(red: 0.27, green: 0.3, blue: 0.33))
                    .padding(.horizontal, 20)
                    .frame(width: 353, height: 62)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94).opacity(0.5))
                    .cornerRadius(12)
                    .contentShape(Rectangle())
                    .onAppear (perform : UIApplication.shared.hideKeyboard)
            }
            .frame(width: 329, alignment: .topLeading)
            
            DateField(
                label: "시작날짜",
                date: startDate.wrappedValue,
                hasSelected: hasSelectedStartDate.wrappedValue,
                showPicker: $showStartPicker
            )
            
            DateField(
                label: "종료날짜",
                date: endDate.wrappedValue,
                hasSelected: hasSelectedEndDate.wrappedValue,
                showPicker: $showEndPicker
            )
            
            Spacer()
            
            Button(action: {
                if let projectId = experienceData.project?.projectId {
                    let updatedProject = ProjectModel(
                        projectId: projectId,
                        projectName: experienceData.title,
                        endDateTime: experienceData.endDate,
                        startDateTime: experienceData.startDate
                    )

                    Task {
                        await updateProject(projectId: projectId, userId: 8, data: updatedProject)
                    }
                } else {
                    print("❌ projectId 없음")
                }
            }) {
                HStack {
                    Text("수정완료")
                        .font(.pretendard(.bold, size: 15))
                        .foregroundColor(.white)
                }
                .frame(width: 353, height: 68)
                .background(isButtonActive ? Color(red: 1, green: 0.6, blue: 0.46) : Color(red: 0.76, green: 0.76, blue: 0.76)
                )
                .cornerRadius(16)
            }
            .disabled(!isButtonActive)
        }
        .padding(.top, 40)
        .padding(.bottom, 20)
        .sheet(isPresented: $showStartPicker) {
            DatePickerModal(
                date: startDate,
                onConfirm: {
                    hasSelectedStartDate.wrappedValue = true
                    showStartPicker = false
                }
            )
        }
        .sheet(isPresented: $showEndPicker) {
            DatePickerModal(
                date: endDate,
                minimumDate: startDate.wrappedValue,
                onConfirm: {
                    hasSelectedEndDate.wrappedValue = true
                    showEndPicker = false
                }
            )
            .onAppear {
                if endDate.wrappedValue < startDate.wrappedValue {
                    endDate.wrappedValue = startDate.wrappedValue
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle("경험 수정")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    //tabSelection = 0            // 홈 탭으로 이동
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
    
    @ViewBuilder
    func DateField(label: String, date: Date, hasSelected: Bool, showPicker: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.pretendard(.medium, size: 15))
                .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
            Button {
                showPicker.wrappedValue.toggle()
            } label: {
                HStack {
                    Text(hasSelected ? formatDate(date) : "날짜를 입력해 주세요.")
                        .font(.pretendard(.regular, size: 13))
                        .foregroundColor(hasSelected ? Color(red: 0.27, green: 0.3, blue: 0.33) : Color(red: 0.71, green: 0.73, blue: 0.74))
                    
                    Spacer()
                    
                    Image("Calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal, 20)
                .frame(width: 353, height: 62)
                .background(Color(red: 0.94, green: 0.94, blue: 0.94).opacity(0.5))
                .cornerRadius(12)
            }
        }
    }
}

private func updateProject(projectId: UUID, userId: Int, data: ProjectModel) async {
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/project/\(projectId)?userId=\(userId)") else {
        print("❌ invalidURL")
        return
    }
    
    let newProject = ProjectModel(projectId: data.projectId, projectName: data.projectName, endDateTime: data.endDateTime, startDateTime: data.startDateTime)
    
    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(newProject)
    } catch {
        print("❌ Encoding Error: \(error)")
        return
    }
    
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("❌ error: \(response)")
            return
        }
    } catch {
        print("❌ Network Error: \(error)")
    }
}

#Preview {
    EditExperienceView()
        .environmentObject(ExperienceData())
}
