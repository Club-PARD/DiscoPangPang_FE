//
//  AnswerButton.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerButton: View {
    
    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    @Binding var navigationPath: NavigationPath
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]

    
    var body: some View {
        Button(action: {
            if answerText[selectedIndex] != "" {
                if selectedIndex < 4 {
                    selectedIndex += 1
                } else {
                    print("finish")
                    navigationPath.removeLast()
                }
            }
        }, label: {
            HStack {
                Spacer()
                
                Text(selectedIndex == 4 ? "경험완료" : "다음 질문")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(height: 68)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(answerText[selectedIndex] == ""
                          ? Color(red: 195/255, green: 195/255, blue: 195/255, opacity: 1)
                          : Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
            )
        })
    }
}

struct PreviousButton: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            selectedIndex -= 1
        }, label: {
            HStack {
                Spacer()
                
                Text("이전 질문")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(Color(red: 195/255, green: 195/255, blue: 195/255, opacity: 1))
                
                Spacer()
            }  // HStack
            .frame(height: 68)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 236/255, green: 236/255, blue: 238/255, opacity: 1))
            )
        })
    }
}

//#Preview {
//    AnswerButton(answerText: "dd")
//}
