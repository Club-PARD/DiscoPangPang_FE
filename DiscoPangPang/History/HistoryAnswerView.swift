//
//  HistoryAnswerVIew.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/11/25.
//

import SwiftUI

struct HistoryAnswerView: View {
    let project: Project
    
    @State private var answerText: [String] = ["", "", "", "", ""]
    @State private var selectedIndex: Int = 0
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 245/255, blue: 246/255, opacity: 1).ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("")
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
        }
        .navigationTitle("답변 보기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74)) // ← 여기서 색 바꿔줌
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    let savedSTARL = try await getSTARL(projectId: project.projectId)
                    await MainActor.run {
                        answerText = [savedSTARL.s, savedSTARL.t, savedSTARL.a, savedSTARL.r, savedSTARL.l]
                        selectedIndex = 0
                        print("✅ STARL 데이터 로드 성공: \(answerText)")
                    }
                } catch {
                    print("❌ STARL 데이터 로드 실패: \(error)")
                }
            }
        }
    }
}

//#Preview {
//    HistoryAnswerView()
//}
