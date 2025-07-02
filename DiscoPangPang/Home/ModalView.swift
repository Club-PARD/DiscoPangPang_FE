//
//  ModalView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct ModalView: View {
    var dismiss: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Button(action: dismiss) {
                HStack(spacing: 24) {
                    Image("edit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)

                    Text("경험 수정하기")
                        .font(Font.custom("Pretendard", size: 13))
                        .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                } //HStack
            }

            Button(action: dismiss) {
                HStack(spacing: 24) {
                    Image("close")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)

                    Text("경험 삭제하기")
                        .font(Font.custom("Pretendard", size: 13))
                        .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                } //HStack
            }
        } //VStack
        .padding(.top, 32)
        .padding(.leading, 24)
        .frame(width: 360, height: 136, alignment: .topLeading)
        .background(
            Color.white
                .cornerRadius(28)
                .shadow(radius: 5)
        )
        .background(
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismiss()
                }
        )
        .cornerRadius(28)
        .shadow(color: .black.opacity(0.3), radius: 1.5, x: 0, y: 1)
        .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 4)
        .ignoresSafeArea(edges: .bottom)
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    ModalView{
        print("닫기")
    }
}
