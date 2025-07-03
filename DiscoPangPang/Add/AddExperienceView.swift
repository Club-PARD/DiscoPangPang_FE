//
//  AddExperienceView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct AddExperienceView: View {
    @State private var title: String = ""
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
    @State private var hasSelectedDate = false
    
    var formattedDate: String {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "yyyy년 M월 d일"
            return formatter.string(from: selectedDate)
        }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            VStack(alignment: .leading, spacing: 8) {
                Text("제목")
                  .font(Font.custom("Pretendard", size: 15))
                  .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                
                TextField("경험의 제목을 입력해 주세요.", text: $title)
                    .font(Font.custom("Pretendard", size: 13))
                    .foregroundColor(title.isEmpty ? Color(red: 0.8, green: 0.82, blue: 0.84) : Color(red: 0.12, green: 0.13, blue: 0.14))
                    .padding(8)
                    .frame(width: 320, height: 40, alignment: .leading)
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -0.75)
                            .stroke(Color(red: 0.9, green: 0.91, blue: 0.92), lineWidth: 1.5)
                    )
            }
            .frame(width: 329, alignment: .topLeading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("마감 날짜")
                  .font(Font.custom("Pretendard", size: 15))
                  .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                
                HStack {
                    Text(hasSelectedDate ? formattedDate : "마감 날짜를 입력해 주세요.")
                        .font(.custom("Pretendard", size: 13))
                        .foregroundColor(hasSelectedDate ? Color(red: 0.12, green: 0.13, blue: 0.14) : Color(red: 0.8, green: 0.82, blue: 0.84))

                    Spacer()

                    Button {
                        showDatePicker.toggle()
                    } label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                }
                .padding(8)
                .frame(width: 320, height: 40, alignment: .leading)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(red: 0.9, green: 0.91, blue: 0.92), lineWidth: 1.5)
                )
            }
            .frame(width: 329, alignment: .topLeading)
            .sheet(isPresented: $showDatePicker) {
                VStack {
                    DatePicker("", selection: $selectedDate, displayedComponents: [.date])
                        .environment(\.locale, Locale(identifier: "ko_KR"))
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .padding()

                    Button("완료") {
                        hasSelectedDate = true
                        showDatePicker = false
                    }
                    .font(.custom("Pretendard", size: 15))
                    .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                    .padding(.bottom, 20)
                }
                .presentationDetents([.height(300)])
            }
            
            Spacer()
            
            Button(action: {
                
            }){
                HStack(alignment: .center, spacing: 8) {
                    Text("다음")
                        .font(
                            Font.custom("Pretendard", size: 17)
                                .weight(.bold)
                        )
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 144)
                .padding(.vertical, 8)
                .frame(width: 320, alignment: .center)
                .background(Color(red: 0.04, green: 0.61, blue: 0.61))
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 4)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 0)
            }
        }
        .padding(.top, 126)
        .padding(.bottom, 40)
    }
}

#Preview {
    AddExperienceView()
}
