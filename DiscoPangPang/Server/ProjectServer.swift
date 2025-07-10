//
//  ProjectServer.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/9/25.
//

import SwiftUI


// MARK: - Project DataModel
struct ProjectModel: Hashable, Codable {
    var projectId: UUID?
    var projectName: String
    var endDateTime: Date
    var startDateTime: Date
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
    
    // 서버로부터 데이터를 받아오는데 실패하면 error를 던지고 함수 종료
    //    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
    //        throw ErrorType.invalidResponse
    //    }
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
        return projects
    } catch {
        print("❌ Decoding Error: \(error)")
        throw ErrorType.networkError
    }
    //    do {
    //        let decoder = JSONDecoder()
    //        // 서버 날짜 포맷 (ISO8601 + 밀리초) 대응
    //        let isoFormatter = ISO8601DateFormatter()
    //        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    //        decoder.dateDecodingStrategy = .custom { decoder in
    //            let container = try decoder.singleValueContainer()
    //            let dateStr = try container.decode(String.self)
    //            if let date = isoFormatter.date(from: dateStr) {
    //                return date
    //            } else {
    //                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format: \(dateStr)")
    //            }
    //        }
    //
    //        let projects = try decoder.decode([ProjectModel].self, from: data)
    //        print("✅ Load Successful!")
    //        print(projects)
    //        return projects
    //    } catch {
    //        print("❌ Decoding Error: \(error)")
    //        throw ErrorType.networkError
    //    }
    
    //    do {
    //        let decoder = JSONDecoder()
    //        decoder.dateDecodingStrategy = .iso8601 // ✅ 날짜 처리
    //
    //        let projects = try decoder.decode([ProjectModel].self, from: data)
    //        print(projects)
    //        print("✅ Load Successful!")
    //        return projects
    //    } catch let decodingError as DecodingError {
    //        print("❌ Decoding Error: \(decodingError)")
    //        throw ErrorType.networkError
    //    } catch {
    //        print("❌ Unexpected Error: \(error)")
    //        throw ErrorType.networkError
    //    }
    //
    
    // 데이터를 성공적으로 받아왔을 경우 do-catch문 실행
    //    do {
    //        // UserModel의 배열 형태로 디코딩하여 결과값 반환
    //        let data = try JSONDecoder().decode([ProjectModel].self, from: data)
    //        print(data)
    //        print("✅ Load Successful!")
    //
    //        return data
    //    } catch {
    //        print("❌ Load Error: \(error)")
    //        throw ErrorType.networkError
    //    }
}

