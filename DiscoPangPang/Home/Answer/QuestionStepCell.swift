//
//  QuestionStepCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct QuestionStepCell: View {
    
    @Binding var selectedIndex: Int
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]
    
    var body: some View {
        HStack(spacing: 4) {
            Spacer()
            
            ForEach(0..<questionTypes.count, id: \.self) { index in
                let type = questionTypes[index]
                
                Button(action: {
                    selectedIndex = index
                    print(selectedIndex)
                    print("선택된 QuestionType: \(type)")
                    print("typeValues: \(type.typeValues)")
                }) {
                    Text(selectedIndex == index ? type.typeValues[1] : type.typeValues[0])
                        .font(.pretendard(.semibold, size: 8))
                        .foregroundColor(
                            selectedIndex == index
                            ? Color(red: 254/255, green: 128/255, blue: 82/255, opacity: 1)
                            : Color(red: 137/255, green: 137/255, blue: 137/255, opacity: 1)
                        )
                        .lineLimit(1)
                        .fixedSize()        // Capsule이 Text에 맞춰 늘어남
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, selectedIndex == index ? 12 : 0)
                        .background(
                            Group {
                                if selectedIndex == index {
                                    Capsule()
                                        .foregroundColor(Color(red: 255/255, green: 230/255, blue: 220/255, opacity: 1))
                                } else {
                                    Circle()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(Color(red: 230/255, green: 232/255, blue: 234/255, opacity: 1))
                                }
                            }
                        )
                        .animation(.easeInOut(duration: 0.25), value: selectedIndex)
                }
            }
        }
    }
}


//#Preview {
//    QuestionStepCell(selectedIndex: $selectedIndex)
//}
