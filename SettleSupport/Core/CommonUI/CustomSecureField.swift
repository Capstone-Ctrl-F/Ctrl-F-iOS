//
//  CustomSecureField.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var password: String
    @State private var isHidePassword: Bool = true
    let secureFieldTitle: String
    let prompt: String
    var body: some View {
        VStack (alignment: .leading) {
            Text(secureFieldTitle)
                .font(.bold16)
                .foregroundStyle(.black)
            SecureField(
                "",
                text: $password,
                prompt: Text(prompt)
                    .foregroundStyle(.gray.opacity(0.5))
            )
            .font(.regular14)
            .padding(.leading, 7)
            .padding(.vertical, isHidePassword ?  13: 12)
            .foregroundStyle(.black)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
            }
            .overlay (alignment: .trailing) {
                Button {
                    isHidePassword.toggle()
                } label: {
                    Image(systemName: isHidePassword ? "eye.slash" : "eye")
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.black)
                        .padding(.trailing, 10)
                }
            }
        }
    }
}

#Preview {
    CustomSecureField(password: .constant(""), secureFieldTitle: "", prompt: "")
}
