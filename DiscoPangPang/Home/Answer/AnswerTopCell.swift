//
//  AnswerTopView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerTopCell: View {
    var body: some View {
        ZStack {
            Text("PARD 5기 롱커톤")
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("임시저장")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                })
                .tint(.black)
            }  // HStack
        }
    }
}

#Preview {
    AnswerTopCell()
}
