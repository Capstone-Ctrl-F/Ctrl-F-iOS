//
//  CustomTextField.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let textfieldTitle: String
    let prompt: String
    var cornerRadiusSize: CGFloat = 4
    var body: some View {
        VStack(alignment: .leading) {
            Text(textfieldTitle)
                .font(.bold16)
                .foregroundStyle(.black)
            TextField(
                "",
                text: $text,
                prompt: Text(prompt)
                    .foregroundStyle(.gray.opacity(0.5))
            )
            .font(.regular14)
            .foregroundStyle(.black)
            .padding(.leading, 7)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: cornerRadiusSize)
                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
            }
        }
    }
}

#Preview {
    CustomTextField(text: .constant(""), textfieldTitle: "비밀번호", prompt: "비밀번호를 입력해주세요")
}
