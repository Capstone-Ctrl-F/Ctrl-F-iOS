//
//  CustomButton.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isDisable: Bool
    let label: String
    let labelColor: Color
    var width: CGFloat = .infinity
    var font: Font = .bold20
    var verticalPadding: CGFloat = 14
    let action: ()->()
    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                if isDisable {
                    Text(label)
                        .font(font)
                        .frame(maxWidth:  width)
                        .foregroundStyle(labelColor)
                        .padding(.vertical, verticalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(.gray.opacity(0.3))
                        )
                } else {
                    Text(label)
                        .font(font)
                        .frame(maxWidth:  width)
                        .foregroundStyle(labelColor)
                        .padding(.vertical, verticalPadding)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(.mint.opacity(0.6))
                        )
                }
            }
            .disabled(isDisable)
        }
    }
}
#Preview {
    CustomButton(isDisable: .constant(false), label: "버튼", labelColor: .white) {
        
    }
}
