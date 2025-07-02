//
//  HomeView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.gray)
                    
                    Text("Logo")
                        .font(.system(size: 10, weight: .bold))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("준우님,")
                    HStack {
                        Text("오늘의 ") +
                        Text("경험").bold() +
                        Text("이")
                    }
                    HStack {
                        Text("내일의 ") +
                        Text("강점").bold() +
                        Text("이 될 거예요.")
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .frame(width: 360, height: 80)
                    
                    Text("캐릭터")
                }
                
                RecordCell(record: mockRecordData)
            }
            .padding(.horizontal, 16)
        }
    }
}


#Preview {
    HomeView()
}
