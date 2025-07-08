//
//  AddTag1VIew.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct AddTag1View: View {
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
                    Text("실행테마")
                        .font(.pretendard(.semibold, size: 15))
                        .foregroundColor(Color(red: 0.37, green: 0.71, blue: 0.97))
                        .padding(.bottom, 2)
                    
                    Text("일을 끝까지 해내는 데 강한 재능을 가진 테마")
                        .font(.pretendard(.regular, size: 13))
                        .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.74))
                        .padding(.bottom, 40)
                    
                    VStack(spacing: 8) {
                        ForEach(strengthTags1) { tag in
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
                        experienceData.tags.labels["실행"] = selectedTagTitle
                        path.append(Route.addTag2)
                    }) {
                        Text("다음")
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
    AddTag1View(path: .constant(NavigationPath()), tabSelection: .constant(0))
        .environmentObject(ExperienceData())
}
