//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    
    @State var isShowCancelAlert: Bool = false
    @Binding var isShowTempSaveAlert: Bool
    
    @Binding var navigationPath: NavigationPath
    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        ZStack {
            Color(red: 244/255, green: 245/255, blue: 246/255, opacity: 1).ignoresSafeArea(edges: .all)
            
            VStack(alignment: .leading, spacing: 8) {
                AnswerTopCell(isShowCancelAlert: $isShowCancelAlert, isShowTempsaveAlert: $isShowTempSaveAlert, navigationPath: $navigationPath)
                    .padding(.bottom, 16)
                
                QuestionStepCell(selectedIndex: $selectedIndex)
                
                QuestionCell(selectedIndex: $selectedIndex)
                    .padding(.bottom, 16)
                
                ExplainCell(selectedIndex: $selectedIndex)
                
                AnswerCell(AnswerText: $answerText[selectedIndex], selectedIndex: $selectedIndex)
                
                Spacer()
            }
            .padding(20)
            
            VStack {
                Spacer()
                
                if selectedIndex == 0 {
                    AnswerButton(answerText: $answerText, selectedIndex: $selectedIndex, navigationPath: $navigationPath)
                } else {
                    HStack(spacing: 12) {
                        PreviousButton(selectedIndex: $selectedIndex)
                        AnswerButton(answerText: $answerText, selectedIndex: $selectedIndex, navigationPath: $navigationPath)
                    }
                }
            }
            .padding()
            
            if isShowCancelAlert {
                Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.32).edgesIgnoringSafeArea(.all)
                CancelAlert(isShowCancelAlert: $isShowCancelAlert, navigationPath: $navigationPath)
                    .padding(.horizontal, 20)
            }
            
//            if isShowTempSaveAlert {
//                TemporarySaveAlert()
//                    .padding(.horizontal, 20)
//                    .offset(y: 225)
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            isShowTempSaveAlert = false
//                        }
//                    }
//            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


//#Preview {
//    AnswerView(navigationPath: $navigationPath, answerText: $answerText)
//}
