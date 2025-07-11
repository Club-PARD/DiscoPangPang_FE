//
//  HistoryData.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/9/25.
//

import SwiftUI

struct ProjectTagGroup: Codable, Identifiable {
    var id: String { labelName } // 고유 ID로 labelName 사용
    let labelName: String
    let projects: [Project]
}

struct Project: Codable {
    var id: UUID { projectId }
    var projectId: UUID
    let projectName: String
    let startDateTime: String
    let endDateTime: String
}
