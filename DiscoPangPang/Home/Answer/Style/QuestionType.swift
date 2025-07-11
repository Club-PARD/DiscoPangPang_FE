//
//  RoundedCorner.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

// 번호 (rawValue)
// STARL, 질문, 설명, 예시

enum QuestionType: String {
    case question1 = "01"
    case question2 = "02"
    case question3 = "03"
    case question4 = "04"
    case question5 = "05"
}

extension QuestionType {
    var typeValues: [String] {
        switch self {
        case .question1:
            return ["S", "Situation", "이 활동은 어떤 상황에서", "하게 되었나요?", "💡 언제, 어디서, 어떤 목적과 배경으로 시작됐는지를 적어주세요!", "ex) 한동대학교 IT 협업 동아리 PARD 5기 롱커톤에서, 기획·디자인·iOS·서버 개발자 등 총 5명이 한 팀을 이뤄 3주 동안 ‘기분’ 앱 서비스를 기획·제작했어요."]
        case .question2:
            return ["T", "Task", "팀 안에서 어떤 역할을 맡으셨고,", "가장 해결하고 싶으셨던 과제는 무엇이었나요?", "💡 맡은 역할과 해결해야 할 핵심 과제를 적어주세요!", "ex) UI/UX 디자이너로서 사용자 경험을 고려한 정보 구조를 설계하고, 개발팀이 원활히 구현할 수 있도록 명확한 와이어프레임과 디자인 시스템을 구축하는 역할을 맡았어요."]
        case .question3:
            return ["A", "Action", "문제 해결을 위해 실행한", "구체적 행동은 무엇이었나요?", "💡 문제 해결을 위해 주도적으로 실행한 행동과 사용 도구를 적어주세요!", "ex) 자기 분석을 자연스럽게 유도하는 인터페이스를 설계하고, 사용자 인터뷰와 설문을 통해 얻은 인사이트로 페르소나와 유저 플로우를 작성했어요. 이후 피그마로 와이어프레임과 UI 키트를 제작해 iOS 개발자와 세부 스타일과 컴포넌트를 조율하고, 노션과 피그마를 통해 실시간 피드백을 반영하며 디자인을 지속적으로 개선했어요."]
        case .question4:
            return ["R", "Result", "그 행동 덕분에", "실제로 어떤 결과가 나오셨나요?", "💡 정량적 수치와 정성적 피드백을 포함해 성과를 구체적으로 적어주세요!", "ex) 3주 만에 기획 단계부터 프로토타입 완성까지 마무리했으며, 최종 발표에서 ‘가장 사용자 친화적인 UI’라는 평가를 받았어요. 특히 자기 장점 시각화와 분석 유도를 위한 UX 부분에서 높은 만족도를 기록했어요."]
        case .question5:
            return ["L", "Learning", "이번 경험에서 느낀", "교훈이나 배운점은 무엇인가요?", "💡 배운점을 다음에 어떻게 적용할지 적어주세요!", "ex)  팀 내에서 효과적인 디자인 커뮤니케이션 역량을 강화했고, 추상적인 개념을 시각화하는 문제 해결형 UX 기획력이 향상되었어요. 또한 빠른 의사결정과 기술적 제약을 함께 고려하는 실현 가능한 디자인 스킬을 체득했어요."]
        }
    }
}


extension QuestionType {
    
}

