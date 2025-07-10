//
//  ModalView.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import SwiftUI

struct ModalView: View {
    var dismiss: () -> Void
    //var onEdit: () -> Void
//    var projectId: String
//    var userId: Int

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
                    //onEdit()
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
                        //await deleteProject(projectId: projectId, userId: userId)
                        dismiss()
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

//private func updateProject(projectId: String, userId: Int, data: ProjectModel) async {
//    let urlString = BaseURL.baseUrl.rawValue
//    guard let url = URL(string: "\(urlString)/project/\(projectId)?userId=\(userId)") else {
//        print("❌ invalidURL")
//        return
//    }
//    
//    let newProject = ProjectModel(projectId: data.projectId, userId: data.userId, projectName: data.projectName, startDateTime: data.startDateTime, endDateTime: data.endDateTime)
//    
//    var request = URLRequest(url: url)
//    request.httpMethod = "PATCH"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    do {
//        request.httpBody = try JSONEncoder().encode(newProject)
//    } catch {
//        print("❌ Encoding Error: \(error)")
//        return
//    }
//    
//    do {
//        let (_, response) = try await URLSession.shared.data(for: request)
//        
//        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//            print("❌ error: \(response)")
//            return
//        }
//    } catch {
//        print("❌ Network Error: \(error)")
//    }
//}

private func deleteProject(projectId: String, userId: Int) async {
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
    ModalView{print("닫기")}
}
