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
                        .font(.custom("Pretendard", size: 15).weight(.semibold))
                        .foregroundColor(Color(red: 1, green: 0.69, blue: 0.08))
                        .padding(.bottom, 2)
                    
                    Text("정보 수집, 분석, 통찰력 발휘에 강한 재능을 가진 테마")
                        .font(.custom("Pretendard", size: 13))
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
                                            .font(.custom("Pretendard", size: 13).weight(.semibold))
                                            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                                        
                                        Text(tag.description)
                                            .font(.custom("Pretendard", size: 10).weight(.medium))
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
                            .font(.custom("Pretendard", size: 15).weight(.bold))
                            .foregroundColor(Color(red: 0.76, green: 0.76, blue: 0.76))
                            .frame(maxWidth: .infinity, maxHeight: 68)
                            .background(Color(red: 0.93, green: 0.92, blue: 0.93))
                            .cornerRadius(16)
                    }
                    
                    Button(action: {
//                        if let deadline = experienceData.endDate {
//                            scheduleDeadlineNotification(deadline: deadline, title: experienceData.title)
//                            }
                        experienceData.tags.labels["전략적사고"] = selectedTagTitle
                        
                        experienceData.reset()
                        path.removeLast(path.count)
                        tabSelection = 0 
                    }) {
                        Text("경험 생성")
                            .font(.custom("Pretendard", size: 15).weight(.bold))
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
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                }
            }
        }
    }
}

#Preview {
    AddTag4View(path: .constant(NavigationPath()), tabSelection: .constant(0))
        .environmentObject(ExperienceData())
}
