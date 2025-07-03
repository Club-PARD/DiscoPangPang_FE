//
//  AnswerButton.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack {
                Spacer()
                Text("저장하기")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 11/255, green: 155/255, blue: 155/255, opacity: 1))
                    .frame(height: 42)
            )
        })
    }
}

#Preview {
    AnswerButton()
}
