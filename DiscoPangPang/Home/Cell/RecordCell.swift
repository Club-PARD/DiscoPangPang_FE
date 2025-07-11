//
//  RecordCel.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct RecordCell: View {
    @EnvironmentObject var experienceData: ExperienceData
    @Binding var navigationPath: NavigationPath
    @State private var isShowModal = false
    @State var dataModels: [ProjectModel] = []
    @State var tagDataModels: [TagLoadModel] = []
    @State private var selectedProject: ProjectModel? = nil
    
    let record: RecordDataModel
    
    let categoryTags: [String: [String]] = [
        "실행": ["성취", "조정자", "신념", "일관성", "신중함", "규율", "집중", "책임", "회복력"],
        "영향력": ["행동력", "지휘", "의사소통", "경쟁", "최상화", "자신감", "중요성", "사람사귀기"],
        "관계 형성": ["적응", "연결성", "성장촉진자", "공감", "조화", "포용", "개별화", "긍정", "친밀"],
        "전략적 사고": ["분석", "맥락", "미래지향", "아이디어", "수집", "사색", "학습자", "전략적사고"]
    ]
    
    let categoryTextColors: [String: Color] = [
        "실행": Color(red: 0.37, green: 0.71, blue: 0.97),
        "영향력": Color(red: 0.49, green: 0.78, blue: 0.56),
        "관계 형성": Color(red: 0.96, green: 0.53, blue: 0.44),
        "전략적 사고": Color(red: 1, green: 0.69, blue: 0.08)
    ]
    
    let categoryBackgroundColors: [String: Color] = [
        "실행": Color(red: 0.91, green: 0.96, blue: 1),
        "영향력": Color(red: 0.92, green: 0.96, blue: 0.93),
        "관계 형성": Color(red: 0.99, green: 0.94, blue: 0.93),
        "전략적 사고": Color(red: 1, green: 0.95, blue: 0.86)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(dataModels.sorted(by: { $0.endDateTime < $1.endDateTime }), id: \.projectId) { dataModel in
                VStack(alignment: .trailing, spacing: 16) {
                    HStack(alignment: .center) {
                        Text(formatDate(dataModel.endDateTime))
                            .font(Font.custom("Pretendard", size: 13))
                            .foregroundColor(Color(red: 0.53, green: 0.56, blue: 0.59))
                        
                        Spacer()
                        
                        Button(action: {
                            experienceData.project = dataModel
                            selectedProject = dataModel
                            isShowModal = true
                        }){
                            Image("more")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    } // HStack
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(dataModel.projectName)
                            .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                        
                        TagListView(tags: dataModel.tags)
                    } //VStack
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 95, height: 42)
                            .background(Color(red: 1, green: 0.6, blue: 0.46))
                            .cornerRadius(12)
                        
                        
                        Button(action: {
                            experienceData.project = dataModel
                            navigationPath.append("AnswerView")
                        }, label: {
                            Text("경험 기록하기")
                                .font(
                                    Font.custom("Pretendard", size: 12)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color.white)
                                .padding(8)
                        })
                        
                    } //ZStack
                } //VStack
                .padding(15)
                .foregroundColor(.clear)
                .frame(width: 353, height: 189)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
                .sheet(isPresented: $isShowModal) {
                    if let selectedProject {
                        ModalView(
                            project: selectedProject,
                            dismiss: {
                                isShowModal = false
                            },
                            onEdit: {
                                experienceData.project = selectedProject
                                experienceData.title = selectedProject.projectName
                                experienceData.startDate = selectedProject.startDateTime
                                experienceData.endDate = selectedProject.endDateTime
                                experienceData.hasSelectedStartDate = true
                                experienceData.hasSelectedEndDate = true
                                
                                navigationPath.append("EditExperience")
                                isShowModal = false
                            }
                        )
                        .presentationDetents([.height(136)])
                        .presentationDragIndicator(.hidden)
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    dataModels = try await getProjectsWithTags(for: 8)
                } catch {
                    print("❌ Failed to load projects with tags: \(error)")
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .didDeleteProject)) { notification in
                    Task {
                        do {
                            print("🔔 프로젝트 삭제 알림 수신, 데이터 다시 불러오기")
                            dataModels = try await getProjectsWithTags(for: 8)
                        } catch {
                            print("❌ Failed to reload projects after deletion: \(error)")
                        }
                    }
                }
    }
    // 날짜 포맷터 함수
    func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "날짜 없음" }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 MM월 dd일" // 연-월-일 형태
        return formatter.string(from: date)
    }
    
    func category(for tag: String) -> String? {
        for (category, tags) in categoryTags {
            if tags.contains(tag) {
                return category
            }
        }
        return nil
    }
    
    @ViewBuilder
    func TagListView(tags: [TagLoadModel]?) -> some View {
        let safeTags = tags ?? []
        HStack(alignment: .top, spacing: 4) {
            ForEach(safeTags, id: \.labelName) { tag in
                let categoryName = category(for: tag.labelName) ?? "기본"
                let textColor = categoryTextColors[categoryName] ?? .gray
                let bgColor = categoryBackgroundColors[categoryName] ?? .gray.opacity(0.1)

                Text(tag.labelName)
                    .font(.custom("Pretendard", size: 11).weight(.semibold))
                    .kerning(0.4)
                    .foregroundColor(textColor)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
                    .background(bgColor)
                    .cornerRadius(8)
            }
        }
    }
}

//#Preview {
//    RecordCell(record: mockRecordData)
//}
