//
//  RecordDataModel.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/2/25.
//

import Foundation

struct RecordDataModel: Codable {
    var id: Int
    var title: String
    var dueDate: String
    var answer: String
    var tag: [String]
}


let mockRecordData: RecordDataModel =
    RecordDataModel(id: 1, title: "PARD 5기 롱커톤", dueDate: "2025.07.01", answer: "", tag: ["적응", "분석", "행동력"])
    
