//
//  CancelAlert.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/7/25.
//

import SwiftUI

struct CancelAlert: View {
    @Binding var isShowCancelAlert: Bool
    @Binding var navigationPath: NavigationPath
    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button(action: {
                    isShowCancelAlert.toggle()
                }, label: {
                    ZStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(Color(red: 188/255, green: 188/255, blue: 188/255, opacity: 1))
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.clear)
                    }
                })
                .padding(.trailing, -4)
            }
            
            Image("image 5416")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 72)
                .padding(.bottom, 16)
            
            HStack(spacing: 0) {
                Text("작성을 ")
                Text("취소")
                    .foregroundColor(Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
                Text("하고 나가시겠습니까?")
            }
            .font(.system(size: 16))
            .padding(.bottom, 8)
            
            Text("작성한 내용들이 모두 사라져요")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 138/255, green: 148/255, blue: 158/255, opacity: 1))
                .padding(.bottom, 32)
            
            HStack(spacing: 132) {
                Button(action: {
                    isShowCancelAlert.toggle()
                }, label: {
                    Text("취소")
                        .foregroundColor(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color(red: 236/255, green: 236/255, blue: 238/255, opacity: 1))
                                .frame(width: 146, height: 52)
                        )
                })
                
                Button(action: {
                    answerText = ["", "", "", "", ""]
                    selectedIndex = 0
                    navigationPath.removeLast()
                }, label: {
                    Text("확인")
                        .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(Color(red: 254/255, green: 153/255, blue: 117/255, opacity: 1))
                                .frame(width: 146, height: 52)
                        )
                })
            }
            .padding(.bottom, 24)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
    }
}

//#Preview {
//    ZStack {
//        Color.gray.ignoresSafeArea(edges: .all)
//        CancelAlert(isShowCancelAlert: $isShowCancelAlert)
//    }
//}
