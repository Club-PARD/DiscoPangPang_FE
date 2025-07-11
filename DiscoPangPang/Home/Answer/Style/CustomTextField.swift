//
//  CustomTextField.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI

struct CustomTextEdit: ViewModifier {
    @Binding var insightText: String
    let placeholder: String
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(alignment: .topLeading) {
                if insightText.isEmpty {
                    Text(placeholder)
                        .lineSpacing(10)
                        .padding(EdgeInsets(top: 22, leading: 20, bottom: 20, trailing: 16))
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 138/255, green: 148/255, blue: 158/255, opacity: 1))
                }
            }
            .autocorrectionDisabled()
            .background(Color(red: 230/255, green: 232/255, blue: 234/255, opacity: 1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .scrollContentBackground(.hidden)
            .font(.system(size: 13))
            .overlay(alignment: .bottomTrailing) {
                Text("\(insightText.count) / 200")
                    .font(.system(size: 13))
                    .foregroundColor(Color(UIColor.systemGray2))
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                    .onChange(of: insightText) { newValue in
                        if newValue.count > 200 {
                            insightText = String(newValue.prefix(200))
                        }
                    }
            }
    }
}

extension TextEditor {
    func customStyleEditor(placeholder: String, userInput: Binding<String>) -> some View {
        self.modifier(CustomTextEdit(insightText: userInput, placeholder: placeholder))
    }
}
