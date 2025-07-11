//
//  HomeView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var navigationPath: NavigationPath
    @Binding var isShowTempSaveAlert: Bool
    
    let userName = UserDefaults.standard.string(forKey: "appleUserName") ?? "사용자"
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Image("GIBOON")
                                .padding(.bottom, 16)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(userName)님,")
                                    .font(Font.custom("Pretendard", size: 18))
                                
                                Text("오늘의 경험이")
                                    .font(Font.custom("Pretendard", size: 18))
                                
                                HStack(spacing: 0) {
                                    Text("내일의 강점")
                                        .font(.pretendard(.bold, size: 18))
                                    
                                    Text("이 될 거예요!")
                                        .font(Font.custom("Pretendard", size: 18))
                                }
                            }  // VStack
                        }  // VStack
                        
                        Spacer()
                        
                        Image("gibooni")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 150)
                            .padding(.trailing, -20)
                    }  // HStack
                    
                    RecordCell(navigationPath: $navigationPath)
                        .padding(.bottom, 20)
                    
                }  // LazyVStack
                .padding(.leading, 20)
            }  // ScrollView
            .background(Color(red: 0.97, green: 0.98, blue: 0.98))
            
            if isShowTempSaveAlert {
                TemporarySaveAlert()
                    .padding(.horizontal, 20)
                    .offset(y: 300)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isShowTempSaveAlert = false
                        }
                    }
            }

        }  // ZStack
    }
}

//#Preview {
//    HomeView(navigationPath: $navigationPath, record: MockRecordData)
//}
