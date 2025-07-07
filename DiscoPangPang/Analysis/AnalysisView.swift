//
//  AnalysisView.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/2/25.
//

import SwiftUI

struct AnalysisView: View {
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.98, blue: 0.98)

            VStack(alignment: .center){
                Text("강점분석")
                    .font(Font.custom("Pretendard", size: 19).weight(.semibold))
                    .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                    .padding(.bottom, 8)
                
                Text("테마 별로 가장 강한 태그 5가지를 보여드릴게요.\n태그 도형의 크기가 클수록 본인에게 강한 태그에요! ")
                    .font( Font.custom("Pretendard", size: 10).weight(.medium))
                    .foregroundColor(Color(red: 0.71, green: 0.73, blue: 0.74))
                    .padding(.bottom, 33)
                
                HStack(spacing: 21) {
                    NavigationLink(destination: AnalysisEXView()) {
                        VStack(alignment: .center) {
                            Text("실행")
                                .font(Font.custom("Pretendard", size: 13).weight(.semibold))
                                .foregroundColor(Color(red: 0.04, green: 0.42, blue: 0.7))
                                .padding(.bottom, 32)
                            
                            EllipticalGradient(
                                stops: [
                                    .init(color: .white, location: 0),
                                    .init(color: Color(red: 0.37, green: 0.71, blue: 0.97), location: 1)
                                ],
                                center: .center
                            )
                            .frame(width: 72, height: 72)
                            .cornerRadius(8)
                        }
                        .frame(width: 168, height: 190, alignment: .center)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.91, green: 0.96, blue: 1), location: 0.50),
                                    Gradient.Stop(color: .white, location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
                    }.buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: AnalysisINView()) {
                        VStack(alignment: .center) {
                            Text("영향력")
                                .font(Font.custom("Pretendard", size: 13).weight(.semibold))
                                .foregroundColor(Color(red: 0.15, green: 0.45, blue: 0.22))
                                .padding(.bottom, 32)
                            
                            Image("Polygon 4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 72, height: 72)
                        }
                        .padding(16)
                        .frame(width: 168, height: 190, alignment: .center)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.92, green: 0.96, blue: 0.93), location: 0.50),
                                    Gradient.Stop(color: .white, location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 24)
                
                HStack(spacing: 21) {
                    NavigationLink(destination: AnalysisRFView()) {
                        VStack(alignment: .center) {
                            Text("관계형성")
                                .font(Font.custom("Pretendard", size: 13).weight(.semibold))
                                .foregroundColor(Color(red: 0.74, green: 0.17, blue: 0.06))
                                .padding(.bottom, 32)
                            
                            Image("Ellipse 26")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 78, height: 78)
                            
                        }
                        .padding(16)
                        .frame(width: 168, height: 190, alignment: .center)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.99, green: 0.94, blue: 0.93), location: 0.50),
                                    Gradient.Stop(color: .white, location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 0),
                                endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
                    }.buttonStyle(PlainButtonStyle())
                    
                    NavigationLink(destination: AnalysisSTView()) {
                        VStack(alignment: .center) {
                            Text("전략적사고")
                                .font(Font.custom("Pretendard", size: 13).weight(.semibold))
                                .foregroundColor(Color(red: 0.54, green: 0.36, blue: 0))
                                .padding(.bottom, 32)
                            
                            EllipticalGradient(
                                stops: [
                                    .init(color: .white, location: 0),
                                    .init(color: Color(red: 1, green: 0.69, blue: 0.08), location: 1)
                                ],
                                center: .center
                            )
                            .frame(width: 57, height: 57)
                            .cornerRadius(8)
                            .rotationEffect(.degrees(45))
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 28.5)
                        .frame(width: 168, height: 190, alignment: .top)
                        .background(
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .white, location: 0.00),
                                    Gradient.Stop(color: Color(red: 1, green: 0.95, blue: 0.86), location: 0.50),
                                    Gradient.Stop(color: .white, location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0.5, y: 1),
                                endPoint: UnitPoint(x: 0.5, y: 0)
                            )
                        )
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 4)
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
            .padding(.bottom, 134)
            .padding(.horizontal, 18)
        }
        .ignoresSafeArea(.all)
        .tint(Color(red: 0.74, green: 0.74, blue: 0.74))
    }
}

#Preview {
    AnalysisView()
}
