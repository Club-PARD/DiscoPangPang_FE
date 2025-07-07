//
//  TemporarySaveAlert.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/7/25.
//

import SwiftUI

struct TemporarySaveAlert: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 36)
                .foregroundColor(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.75))
            
            Text("임시저장이 완료되었어요!")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
        }
    }
}

#Preview {
    TemporarySaveAlert()
}
