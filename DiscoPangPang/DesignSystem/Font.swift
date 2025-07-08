//
//  Font.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

extension Font {
    enum PretendardWeight {
        case black
        case bold
        case medium
        case regular
        case semibold
        case light
        
        var value: String {
            switch self {
            case .black:
                return "Black"
            case .bold:
                return "Bold"
            case .medium:
                return "Medium"
            case .regular:
                return "Regular"
            case .semibold:
                return "SemiBold"
            case .light:
                return "Light"
            }
        }
    }

    static func pretendard(_ weight: PretendardWeight, size fontSize: CGFloat) -> Font {
        let familyName = "Pretendard"
        let weightString = weight.value

        return Font.custom("\(familyName)-\(weightString)", size: fontSize)
    }
}
