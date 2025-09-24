//
//  SignUpView.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var isDuplicateID: Bool = true
    @State private var idMessage: IDMessage = .isEmty
    @State private var isCorrectID: Bool = true
    
    enum IDMessage {
        case isAvailable
        case correct
        case isEmty
        case invalidFormat
        case isDuplicate
        
        var idMessage: String {
            switch self {
            case .isAvailable:
                return "사용가능한 아이디 입니다"
            case .correct:
                return "올바른 아이디 형식입니다"
            case .isEmty:
                return "입력 칸이 비어있습니다"
            case .invalidFormat:
                return "올바른 아이디 형식이 아닙니다"
            case .isDuplicate:
                return "이미 사용중인 아이디입니다"
            }
        }
        var idMessageColor: Color  {
            switch self {
            case .correct, .isAvailable:
                return .mint.opacity(0.6)
            case .invalidFormat, .isDuplicate,.isEmty:
                return .red.opacity(0.8)
            }
        }
        var isVerified: Bool {
            switch self {
            case .correct, .isAvailable:
                return true
            case .invalidFormat,.isDuplicate,.isEmty:
                return false
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                
                Spacer()
                    .frame(height: 45)
                
                Spacer()
                    .frame(height: 60)
                
                HStack (alignment: .bottom, spacing: 8) {
                    
                    CustomTextField(text: $email, textfieldTitle: "", prompt: "아이디를 입력해주세요")
                    
                    CustomButton(isDisable: $isCorrectID, label: "중복확인", labelColor: .white, width: 80, font: .semibold16, verticalPadding: 12) {
                        isCorrectID = true
                    }                }
                Text(idMessage.idMessage)
                    .font(.regular14)
                    .foregroundStyle(idMessage.idMessageColor)
                    .onChange(of: email) { _ , _ in
                        if !isValidEmail(email: email) {
                            idMessage = .invalidFormat
                            isCorrectID = true
                            isDuplicateID = true
                        } else {
                            idMessage = .correct
                            isCorrectID = false
                        }
                    }
                
                Spacer()
                
                CustomButton(isDisable: $isDuplicateID, label: "다음", labelColor: .white, width: .infinity, font: .semibold16) {
                }
            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Button {
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .aspectRatio(contentMode: .fit)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
}

#Preview {
    SignUpView()
}
