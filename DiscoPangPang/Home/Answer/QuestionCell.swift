//
//  QuestionCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct QuestionCell: View {
    
    @State var answerText: String = ""
    private let placeholder: String = "내용을 작성해주세요."
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button(action: {
                    
                }, label: {
                    Text("S(상황)")
                        .frame(width: 64, height: 24)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .fill(Color(red: 70/255, green: 76/255, blue: 83/255, opacity: 1))
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        )
                })

                Button(action: {
                    
                }, label: {
                    Text("T(과제)")
                        .frame(width: 64, height: 24)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .fill(Color(red: 88/255, green: 97/255, blue: 106/255, opacity: 1))
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        )
                })

                Button(action: {
                    
                }, label: {
                    Text("A(행동)")
                        .frame(width: 64, height: 24)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .fill(Color(red: 109/255, green: 120/255, blue: 130/255, opacity: 1))
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        )
                })

                Button(action: {
                    
                }, label: {
                    Text("R(결과)")
                        .frame(width: 64, height: 24)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .fill(Color(red: 138/255, green: 148/255, blue: 158/255, opacity: 1))
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        )
                })

                Button(action: {
                    
                }, label: {
                    Text("L(배운점)")
                        .frame(width: 64, height: 24)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .background(
                            Rectangle()
                                .fill(Color(red: 177/255, green: 184/255, blue: 190/255, opacity: 1))
                                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                        )
                })

                
                
                
                
                
                
                
                
                
            }  // HStack
        }  // VStack
    }
}

#Preview {
    QuestionCell()
}
