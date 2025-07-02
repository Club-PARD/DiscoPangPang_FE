//
//  AnswerTopView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerTopView: View {
    var body: some View {
        ZStack {
            Text("PARD 5기 롱커톤")
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "xmark")
                })
                .tint(.black)
            }
        }
    }
}

#Preview {
    AnswerTopView()
}
