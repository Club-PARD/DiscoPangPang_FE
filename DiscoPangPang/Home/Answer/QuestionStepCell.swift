//
//  QuestionStepCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct QuestionStepCell: View {
    
    @State private var selectedIndex: Int = 0
    
    var questionIndex: [String] = ["S", "T", "A", "R", "L"]
    
    var body: some View {
        HStack(spacing: 4) {
            Spacer()
            
            ForEach(0..<questionIndex.count, id: \.self) { index in
                Button(action: {
                    selectedIndex = index
                }, label: {
                    Text(questionIndex[index])
                        .font(.system(size: 8))
                        .foregroundColor(selectedIndex == index ? Color(red: 254/255, green: 128/255, blue: 82/255, opacity: 1) : Color(red: 137/255, green: 137/255, blue: 137/255, opacity: 1))
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
                })
            }
        }
    }
}


#Preview {
    QuestionStepCell()
}
