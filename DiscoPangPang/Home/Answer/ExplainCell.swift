//
//  ExplainCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/4/25.
//

import SwiftUI

struct ExplainCell: View {
    var body: some View {
        Text("💡 언제, 어디서, 어떤 목적과 배경으로 시작됐는지를 적어주세요!")
            .font(.system(size: 11))
            .foregroundColor(Color(red: 146/255, green: 146/255, blue: 146/255, opacity: 1))
    }
}

#Preview {
    ExplainCell()
}
