//
//  TagServer.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/10/25.
//

import SwiftUI


// MARK: - Tag Load DataModel
struct TagLoadModel: Hashable, Codable, Identifiable {
    var id: UUID?
    var projectId: UUID
    var labelName: String
}



func TagLoadGet(_ id: UUID) async throws -> [TagLoadModel] {
    // 1. URL 만들기
    let urlString = BaseURL.baseUrl.rawValue
    guard let url = URL(string: "\(urlString)/label/project/\(id.uuidString)") else {
        throw ErrorType.invalidURL
    }
    
    print("🌐 Requesting URL: \(url.absoluteString)") // URL 확인
    
    // 2. 요청
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        throw ErrorType.invalidResponse
    }
    
    do {
        let decoded = try JSONDecoder().decode([TagLoadModel].self, from: data)
        print("✅ Tags for Project \(id): \(decoded.map { $0.labelName })")
        return decoded
    } catch {
        print("❌ Tag Decoding Error: \(error)")
        throw ErrorType.networkError
    }
}
