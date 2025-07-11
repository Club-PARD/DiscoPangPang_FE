//
//  AnswerTopView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerTopCell: View {
    @EnvironmentObject var experienceData: ExperienceData
    @Binding var isShowCancelAlert: Bool
    @Binding var isShowTempsaveAlert: Bool
    @Binding var navigationPath: NavigationPath
    @Binding var answerText: [String]
    
    var body: some View {
        ZStack {
            Text("답변 기록하기")
            
            HStack {
                Button(action: {
                    self.isShowCancelAlert.toggle()
                    print(isShowCancelAlert)
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.clear)
                    }
                })
                
                Spacer()
                
                Button(action: {
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
                        } else {
                            print("❌ projectId가 없습니다")
                        }
                    }
                    self.isShowTempsaveAlert.toggle()
                    navigationPath.removeLast()
                }, label: {
                    Text("임시저장")
                        .font(.pretendard(.medium, size: 12))
                        .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                })
                .tint(.black)
            }  // HStack
        }  // ZStack
    }
}

//#Preview {
//    AnswerTopCell(navigationPath: $navigationPath)
//}
