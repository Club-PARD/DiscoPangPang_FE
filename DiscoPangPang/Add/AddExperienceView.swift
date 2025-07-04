//
//  AddExperienceView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct AddExperienceView: View {
    @State private var title: String = ""
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var showStartPicker = false
    @State private var showEndPicker = false
    @State private var hasSelectedStartDate = false
    @State private var hasSelectedEndDate = false
    
    @Binding var path: NavigationPath
    @Binding var tabSelection: Int
    
    var isButtonActive: Bool {
        !title.isEmpty && hasSelectedStartDate && hasSelectedEndDate
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
                    .font(Font.custom("Pretendard", size: 15))
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                            
                TextField("경험의 제목을 입력해 주세요.", text: $title)
                    .font(Font.custom("Pretendard", size: 13))
                    .foregroundColor(title.isEmpty ? Color(red: 0.71, green: 0.73, blue: 0.74) : Color(red: 0.27, green: 0.3, blue: 0.33))
                    .padding(.horizontal, 20)
                    .frame(width: 353, height: 62)
                    .background(Color(red: 0.94, green: 0.94, blue: 0.94).opacity(0.5))
                    .cornerRadius(12)
            }
            .frame(width: 329, alignment: .topLeading)
            
            DateField(
                label: "시작날짜",
                date: startDate,
                hasSelected: hasSelectedStartDate,
                showPicker: $showStartPicker
            )
            
            DateField(
                label: "종료날짜",
                date: endDate,
                hasSelected: hasSelectedEndDate,
                showPicker: $showEndPicker
            )
            
            Spacer()
            
            Button(action: {
                path.append(Route.addTag1)
            }) {
                HStack {
                    Text("다음")
                        .font(Font.custom("Pretendard", size: 15).weight(.bold))
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
                date: $startDate,
                onConfirm: {
                    hasSelectedStartDate = true
                    showStartPicker = false
                }
            )
        }
        .sheet(isPresented: $showEndPicker) {
            DatePickerModal(
                date: $endDate,
                onConfirm: {
                    hasSelectedEndDate = true
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
                    path.removeLast(path.count) // 네비게이션 스택 초기화
                    tabSelection = 0            // 홈 탭으로 이동
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                }
            }
        }
    }
    
    @ViewBuilder
    func DateField(label: String, date: Date, hasSelected: Bool, showPicker: Binding<Bool>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(Font.custom("Pretendard", size: 15))
                .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
            
            HStack {
                Text(hasSelected ? formatDate(date) : "마감 날짜를 입력해 주세요.")
                    .font(.custom("Pretendard", size: 13))
                    .foregroundColor(hasSelected ? Color(red: 0.27, green: 0.3, blue: 0.33) : Color(red: 0.71, green: 0.73, blue: 0.74))
                
                Spacer()
                
                Button {
                    showPicker.wrappedValue.toggle()
                } label: {
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 20)
            .frame(width: 353, height: 62)
            .background(Color(red: 0.94, green: 0.94, blue: 0.94).opacity(0.5))
            .cornerRadius(12)
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
            .font(.custom("Pretendard", size: 15))
            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
            .padding(.bottom, 20)
        }
        .presentationDetents([.height(300)])
    }
}

#Preview {
    AddExperienceView(path: .constant(NavigationPath()), tabSelection: .constant(0))
}
