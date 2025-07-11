//
//  Server.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI


// MockData
struct UserModel: Codable, Hashable {
    var id: Int?
    let name: String
    let age: Int
    let part: String
}

struct TagModel: Codable {
    var projectId: UUID
    var labels: [LabelData]
}

struct LabelData: Codable {
    var labelName: String?
    var labelCategory: String
}

struct STARLModel: Codable, Hashable {
    let s: String
    let t: String
    let a: String
    let r: String
    let l: String
}


class ExperienceData: ObservableObject {
    @Published var project: ProjectModel?
    @Published var tags: TagModel?

    @Published var title: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var hasSelectedStartDate: Bool = false
    @Published var hasSelectedEndDate: Bool = false
    
    func reset() {
        project = nil
        tags = nil
        title = ""
        startDate = Date()
        endDate = Date()
        hasSelectedStartDate = false
        hasSelectedEndDate = false
    }
    
    func setFromProject(_ project: ProjectModel) {
        self.project = project
        self.title = project.projectName
        self.startDate = project.startDateTime
        self.endDate = project.endDateTime
        self.hasSelectedStartDate = true
        self.hasSelectedEndDate = true
    }
}


// 에러타입 정의
enum ErrorType: Error {
    case invalidURL
    case invalidResponse
    case networkError
}


// GET 함수
private func getUserList(_ search: String = "all") async throws -> [UserModel] {
    
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/user?part=\(search)") else {
        throw ErrorType.invalidURL
    }
    
    // 2. URLSession 구성 및 URLSession Task 만든 후 task 요청
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // 서버로부터 데이터를 받아오는데 실패하면 error를 던지고 함수 종료
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw ErrorType.invalidResponse
    }
    
    // 데이터를 성공적으로 받아왔을 경우 do-catch문 실행
    do {
        // UserModel의 배열 형태로 디코딩하여 결과값 반환
        let data = try JSONDecoder().decode([UserModel].self, from: data)
        print(data)
        print("✅ Load Successful!")
        
        return data
    } catch {
        print("❌ Load Error: \(error)")
        throw ErrorType.networkError
    }
}


// POST 함수
private func postUser(data: UserModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/user") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 새로운 데이터 생성
    let newUser = UserModel(id: nil, name: data.name, age: data.age, part: data.part)
    
    // 3. get이 아닌 경우 URLRequest 객체 생성하기
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(newUser)
    } catch {
        print("❌ Encoding Error: \(error)")
        return
    }
    
    // 4. URLSession 구성 및 URLSession Task 만든 후 네트워크 요청
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
        
        // 서버로부터 데이터를 받아오는데 실패하면 error를 던지고 함수 종료
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("❌ Response Error: \(response)")
            return
        }
        
        print("✅ Post Successful!")
    } catch {
        print("❌ Network Error: \(error)")
    }
}


// PATCH 함수
private func updateUser(id: Int, data: UserModel) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/user\(id)") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. 업데이트할 데이터 구성
    let updatedUser = UserModel(id: nil, name: data.name, age: data.age, part: data.part)
    
    // 3. PUT 요청 설정
    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // 4. 요청 바디(JSON 인코딩)
    do {
        request.httpBody = try JSONEncoder().encode(updatedUser)
    } catch {
        print("❌ Encoding Error: \(error)")
        return
    }
    
    // 5. 서버 요청 및 응답 처리
    do {
        let (_, response) = try await URLSession.shared.data(for: request)
    
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("❌ Response Error: \(response)")
            return
        }
    
        print("✅ Update Successful!")
    } catch {
        print("❌ Network Error: \(error)")
    }
}

// DELETE 함수
private func deleteUser(id: Int) async {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/user\(id)") else {
        print("❌ invalidURL")
        return
    }
    
    // 2. URLRequest 설정 (DELETE 메서드 사용)
    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    
    // 3. 서버 요청 및 응답 처리
    do {
        let (_, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            print("❌ Response Error: \(response)")
            return
        }

        print("✅ Delete Successful!")
    } catch {
        print("❌ Network Error: \(error)")
    }
}
