//
//  AddExperienceView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct AddExperienceView: View {
    @EnvironmentObject var experienceData: ExperienceData
    
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    
    @Binding var path: NavigationPath
    @Binding var tabSelection: Int
    
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
                experienceData.project = ProjectModel(
                    projectId: UUID(),
                    userId: 1, // 또는 로그인된 사용자의 userId
                    projectName: experienceData.title,
                    startDateTime: experienceData.startDate,
                    endDateTime: experienceData.endDate
                )
                path.append(Route.addTag1)
            }) {
                HStack {
                    Text("다음")
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
                onConfirm: {
                    hasSelectedEndDate.wrappedValue = true
                    showEndPicker = false
                }
            )
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle("경험 추가")
        .navigationBarTitleDisplayMode(.inline)
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
                    Text(hasSelected ? formatDate(date) : "마감 날짜를 입력해 주세요.")
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

struct DatePickerModal: View {
    @Binding var date: Date
    var onConfirm: () -> Void

    var body: some View {
        VStack {
            DatePicker("", selection: $date, displayedComponents: [.date])
                .environment(\.locale, Locale(identifier: "ko_KR"))
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()

            Button("완료") {
                onConfirm()
            }
            .font(.pretendard(.bold, size: 15))
            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
            .padding(.bottom, 20)
        }
        .presentationDetents([.height(300)])
    }
}

#Preview {
    AddExperienceView(path: .constant(NavigationPath()), tabSelection: .constant(0))
        .environmentObject(ExperienceData())
}
