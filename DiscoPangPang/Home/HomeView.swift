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
                HStack{
                    VStack(alignment: .leading, spacing: 15){
                        Text("Logo")
                            .font(.system(size: 10, weight: .bold))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("준우님,")
                                .font(Font.custom("Pretendard", size: 18))
                            
                            Text("오늘의 경험이")
                                .font(Font.custom("Pretendard", size: 18))
                            
                            HStack(spacing: 0) {
                                Text("내일의 강점")
                                    .font(Font.custom("Pretendard", size: 18).weight(.bold))
                                
                                Text("이 될 거예요!")
                                    .font(Font.custom("Pretendard", size: 18))
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Image("gibooni")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 150)
                }
                
                RecordCell(record: mockRecordData)
            }
            .padding(.leading, 20)
        }
        .background(Color(red: 0.97, green: 0.98, blue: 0.98))
    }
}


#Preview {
    HomeView()
}
