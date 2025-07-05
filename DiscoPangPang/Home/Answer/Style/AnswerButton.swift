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
            .frame(height: 68)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
            )
        })
    }
}

#Preview {
    AnswerButton()
}
