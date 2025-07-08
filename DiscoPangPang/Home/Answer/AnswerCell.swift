//
//  AnswerInsigntCell.swift
//  DiscoPangPang
//
//  Created by  Lucid on 7/3/25.
//

import SwiftUI
import Foundation


extension UIApplication {
    func hideKeyboard() {
        guard let window = windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}


struct AnswerCell: View {
    
    @Binding var AnswerText: String
    //    @Binding var answerText: [String]
    @Binding var selectedIndex: Int
    
    let questionTypes: [QuestionType] = [.question1, .question2, .question3, .question4, .question5]
    
    var body: some View {
        let placeholder = questionTypes[selectedIndex].typeValues[5]
        
        TextEditor(text: $AnswerText)
            .customStyleEditor(placeholder: placeholder, userInput: $AnswerText)
            .frame(height: 268)
            .animation(.easeInOut, value: selectedIndex)
            .onAppear (perform : UIApplication.shared.hideKeyboard)
    }
}





//#Preview {
//    AnswerCell(selectedIndex: .constant(0))
//}
