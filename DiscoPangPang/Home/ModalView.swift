//
//  ModalView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var experienceData: ExperienceData
    var project: ProjectModel?
    var dismiss: () -> Void
    var onEdit: () -> Void

    var body: some View {
        ZStack {
            Color(red: 218/255, green: 220/255, blue: 220/255, opacity: 1)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            VStack(alignment: .leading, spacing: 32) {
                Button(action: {
                    dismiss()
                    onEdit()
                }, label: {
                    HStack(spacing: 24) {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("경험 수정하기")
                            .font(Font.custom("Pretendard", size: 13))
                            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                    }  //HStack
                })
                
                Button(action: {
                    Task {
                        print("삭제 시도 project: \(experienceData.project as Any)")
                                print("삭제 시도 projectId: \(experienceData.project?.projectId as Any)")
                        if let projectId = project?.projectId {
                            await deleteProject(projectId: projectId)
                            dismiss()
                        } else {
                            print("❌ projectId is nil")
                        }
                    }
                }, label: {
                    HStack(spacing: 24) {
                        Image("Close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("경험 삭제하기")
                            .font(Font.custom("Pretendard", size: 13))
                            .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
                    }  //HStack
                })
            } // VStack
            .padding(EdgeInsets(top: 32, leading: 24, bottom: 0, trailing: 0))
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
}

private func deleteProject(projectId: UUID,_ userId: Int = 8) async {
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/project/\(projectId)?userId=\(userId)") else {
        print("❌ invalidURL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("❌ error: \(response)")
            return
        }
    } catch {
        print("❌ Network Error: \(error)")
    }
}

#Preview {
    ModalView(
        dismiss: { print("닫기") },
        onEdit: { print("수정하기") }
    )
}
