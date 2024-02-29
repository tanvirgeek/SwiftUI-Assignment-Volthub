//
//  SecureInputView.swift
//  Volthub
//
//  Created by Tanvir Alam on 29/2/24.
//

import SwiftUI

struct SecureInputView: View {

    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }, label: {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            })
        }
        .padding()
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(AppColors.darkGray.opacity(0.4))
        )
    }
}

#Preview {
    @State var text = ""
    return SecureInputView("", text: $text)
}
