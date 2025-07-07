//
//  StrengthTag.swift
//  DiscoPangPang
//
//  Created by 임재성 on 7/4/25.
//

import SwiftUI

struct StrengthTag: Identifiable {
    let id = UUID()
    let color: Color
    let title: String
    let description: String
}

let strengthTags1: [StrengthTag] = [
    StrengthTag(color: Color(red: 0.83, green: 0.92, blue: 0.99), title: "성취", description: "끊임없이 무언가를 이루고자 하며, 일하는 것에서 에너지를 얻습니다."),
    StrengthTag(color: Color(red: 0.62, green: 0.82, blue: 0.98), title: "조정자", description: "다양한 요소들을 조정하고 재구성하여 효과적인 결과를 이끌어냅니다."),
    StrengthTag(color: Color(red: 0.37, green: 0.71, blue: 0.97), title: "신념", description: "삶의 핵심 가치에 기반해 행동하며, 일에 깊은 의미를 부여합니다."),
    StrengthTag(color: Color(red: 0.13, green: 0.6, blue: 0.95), title: "일관성", description: "공정성과 규칙을 중시하며, 모두에게 동일한 기준을 적용하고자 합니다."),
    StrengthTag(color: Color(red: 0.04, green: 0.47, blue: 0.8), title: "신중함", description: "결정을 내리기 전에 신중하게 위험을 고려합니다."),
    StrengthTag(color: Color(red: 0.04, green: 0.42, blue: 0.7), title: "규율", description: "체계적이고 질서를 좋아하며, 계획에 따라 움직이는 것을 선호합니다."),
    StrengthTag(color: Color(red: 0.03, green: 0.34, blue: 0.57), title: "집중", description: "명확한 목표에 집중하고 산만함 없이 그 목표를 향해 전진합니다."),
    StrengthTag(color: Color(red: 0.02, green: 0.22, blue: 0.38), title: "책임", description: "약속을 매우 중요하게 생각하며, 맡은 일에 대해 반드시 완수하려 합니다."),
    StrengthTag(color: Color(red: 0.01, green: 0.15, blue: 0.25), title: "회복력", description: "문제를 해결하고 고치는 데 뛰어난 능력을 가집니다."),
    StrengthTag(color: Color(red: 0.96, green: 0.96, blue: 0.96), title: "선택안함", description: "")
]

let strengthTags2: [StrengthTag] = [
    StrengthTag(color: Color(red: 0.85, green: 0.93, blue: 0.87), title: "행동력", description: "아이디어를 행동으로 전환시키는 데 강하고, 빠르게 움직입니다."),
    StrengthTag(color: Color(red: 0.66, green: 0.85, blue: 0.71), title: "지휘", description: "확신 있고 자신 있게 리드하며, 결정을 주도합니다."),
    StrengthTag(color: Color(red: 0.49, green: 0.78, blue: 0.56), title: "의사소통", description: "생각이나 정보를 명확하고 매력적으로 전달하는 데 강합니다."),
    StrengthTag(color: Color(red: 0.25, green: 0.65, blue: 0.33), title: "경쟁", description: "비교를 통해 동기를 얻으며, 이기고자 하는 열망이 큽니다."),
    StrengthTag(color: Color(red: 0.13, green: 0.53, blue: 0.22), title: "최상화", description: "평균보다는 탁월함을 추구하며, 강점을 극대화하고자 합니다."),
    StrengthTag(color: Color(red: 0.15, green: 0.45, blue: 0.22), title: "자신감", description: "스스로의 판단과 능력에 깊은 신뢰를 가집니다."),
    StrengthTag(color: Color(red: 0.16, green: 0.36, blue: 0.2), title: "중요성", description: "중요한 존재로 인정받고자 하며, 영향력 있는 일을 선호합니다."),
    StrengthTag(color: Color(red: 0.12, green: 0.28, blue: 0.15), title: "사람사귀기", description: "새로운 사람들과 쉽게 관계를 맺고 친밀해지는 것을 즐깁니다."),
    StrengthTag(color: Color(red: 0.96, green: 0.96, blue: 0.96), title: "선택안함", description: "")
]

let strengthTags3: [StrengthTag] = [
    StrengthTag(color: Color(red: 0.99, green: 0.87, blue: 0.85), title: "적응", description: "현재에 집중하며 유연하게 상황에 대처합니다."),
    StrengthTag(color: Color(red: 0.97, green: 0.69, blue: 0.63), title: "연결성", description: "모든 것이 서로 연결되어 있따는 믿음을 가지고 있습니다."),
    StrengthTag(color: Color(red: 0.96, green: 0.53, blue: 0.44), title: "성장촉진자", description: "다른 사람의 잠재력을 발견하고 성장하도록 돕는 것을 즐깁니다."),
    StrengthTag(color: Color(red: 0.94, green: 0.37, blue: 0.26), title: "공감", description: "타인의 감정을 깊이 이해하고 느낄 수 있는 능력이 뛰어납니다."),
    StrengthTag(color: Color(red: 0.87, green: 0.2, blue: 0.07), title: "조화", description: "갈등보다는 합의와 조화를 추구합니다."),
    StrengthTag(color: Color(red: 0.74, green: 0.17, blue: 0.06), title: "포용", description: "주변에서 소외된 사람을 끌어들이고 모두를 참여시키고자 합니다."),
    StrengthTag(color: Color(red: 0.54, green: 0.14, blue: 0.06), title: "개별화", description: "사람마다 고유한 성향을 이해하고 그에 맞는 방식으로 대합니다."),
    StrengthTag(color: Color(red: 0.36, green: 0.09, blue: 0.04), title: "긍정", description: "낙천적이고 에너지 넘치며 주변 사람들에게 활력을 줍니다."),
    StrengthTag(color: Color(red: 0.22, green: 0.05, blue: 0.02), title: "친밀성", description: "깊고 의미 있는 관계를 맺는 것을 중요하게 생각합니다."),
    StrengthTag(color: Color(red: 0.96, green: 0.96, blue: 0.96), title: "선택안함", description: "")
]

let strengthTags4: [StrengthTag] = [
    StrengthTag(color: Color(red: 1, green: 0.88, blue: 0.64), title: "분석", description: "논리와 데이터를 중시하며, 사실을 기반으로 사고합니다."),
    StrengthTag(color: Color(red: 1, green: 0.79, blue: 0.36), title: "맥락", description: "과거의 경험과 배경을 통해 현재를 이해하고 해석합니다."),
    StrengthTag(color: Color(red: 1, green: 0.69, blue: 0.08), title: "미래지향", description: "미래를 생생하게 상상하고, 그 가능성에 열정을 느낍니다."),
    StrengthTag(color: Color(red: 0.78, green: 0.52, blue: 0), title: "아이디어", description: "창의적인 아이디어를 떠올리는 것을 즐기며, 연결을 잘 만들어냅니다."),
    StrengthTag(color: Color(red: 0.62, green: 0.42, blue: 0), title: "수집", description: "지식, 사실, 아이템 등을 수집하는 것을 좋아합니다."),
    StrengthTag(color: Color(red: 0.54, green: 0.36, blue: 0), title: "사색", description: "깊은 사고와 내적 탐구를 즐기며, 생각하는 과정에서 에너지를 얻습니다."),
    StrengthTag(color: Color(red: 0.38, green: 0.25, blue: 0), title: "학습자", description: "배우는 과정 자체에서 만족을 느끼며, 지속적인 성장을 추구합니다."),
    StrengthTag(color: Color(red: 0.26, green: 0.17, blue: 0), title: "전략적사고", description: "선택지를 빠르게 분석하고 가장 효율적인 경로를 선택합니다."),
    StrengthTag(color: Color(red: 0.96, green: 0.96, blue: 0.96), title: "선택안함", description: "")
]
