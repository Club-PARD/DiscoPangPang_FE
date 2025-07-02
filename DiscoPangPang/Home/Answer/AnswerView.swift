//
//  AnswerView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea(edges: .all)
            
            VStack {
                AnswerTopView()
                    .border(Color.white, width: 1)
            }
            .padding(36)
            .border(Color.white, width: 1)
        }
    }
}

#Preview {
    AnswerView()
}
