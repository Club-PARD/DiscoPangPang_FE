//
//  AnswerTopView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct AnswerTopCell: View {
    
    @Binding var isShowCancelAlert: Bool
    @Binding var isShowTempsaveAlert: Bool
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        ZStack {
            Text("PARD 5기 롱커톤")
            
            HStack {
                Button(action: {
                    self.isShowCancelAlert.toggle()
                    print(isShowCancelAlert)
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.clear)
                    }
                })
                
                Spacer()
                
                Button(action: {
                    self.isShowTempsaveAlert.toggle()
                    navigationPath.removeLast()
                    // 서버 연결 (POST, UPDATE)
                }, label: {
                    Text("임시저장")
                        .font(.pretendard(.medium, size: 12))
                        .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                })
                .tint(.black)
            }  // HStack
        }  // ZStack
    }
}

//#Preview {
//    AnswerTopCell(navigationPath: $navigationPath)
//}
