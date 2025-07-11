//
//  ProjectServer.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/9/25.
//

import SwiftUI


// MARK: - Project DataModel
struct ProjectModel: Hashable, Codable, Identifiable {
    var id: UUID { projectId }
    var projectId: UUID
    var projectName: String
    var endDateTime: Date
    var startDateTime: Date
    var tags: [TagLoadModel]?
}



// MARK: - Project GET 함수
func getProjectModel(_ search: Int = 8) async throws -> [ProjectModel] {
    
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/project/user/\(search)") else {
        throw ErrorType.invalidURL
    }
    
    print("🌐 Requesting URL: \(url.absoluteString)") // ✅ URL 확인
    
    // 2. URLSession 구성 및 URLSession Task 만든 후 task 요청
    let (data, response) = try await URLSession.shared.data(from: url)
    
    // 3. 응답 상태코드 확인
    guard let httpResponse = response as? HTTPURLResponse else {
        print("❌ Not an HTTP response")
        throw ErrorType.invalidResponse
    }
    
    print("📡 Status Code: \(httpResponse.statusCode)") // ✅ 상태코드 출력
    
    guard (200...299).contains(httpResponse.statusCode) else {
        print("❌ Invalid status code: \(httpResponse.statusCode)")
        throw ErrorType.invalidResponse
    }
    
    // 4. 데이터 디코딩
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            // 첫 번째: 밀리초 있는 포맷 시도
            let isoFormatterWithFraction = ISO8601DateFormatter()
            isoFormatterWithFraction.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = isoFormatterWithFraction.date(from: dateStr) {
                return date
            }
            
            // 두 번째: 밀리초 없는 포맷 시도
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime]
            if let date = isoFormatter.date(from: dateStr) {
                return date
            }
            
            // 세 번째: fallback (yyyy-MM-dd'T'HH:mm:ss) 처리
            let fallbackFormatter = DateFormatter()
            fallbackFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            fallbackFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            if let date = fallbackFormatter.date(from: dateStr) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unrecognized date format: \(dateStr)")
        }
        
        let projects = try decoder.decode([ProjectModel].self, from: data)
        print("✅ Load Successful!")
        print(projects)
        print("\n")
        return projects
    } catch {
        print("❌ Decoding Error: \(error)")
        throw ErrorType.networkError
    }
}




func getProjectsWithTags(for userId: Int) async throws -> [ProjectModel] {
    var projects = try await getProjectModel(userId) // 프로젝트 가져오기

    for i in projects.indices {
        let projectId = projects[i].projectId
        let tags = try await TagLoadGet(projectId) // 각 프로젝트의 태그 가져오기
        projects[i].tags = tags // 태그 붙이기
    }

    print("✅ All Projects with Tags Loaded")
    return projects
}

