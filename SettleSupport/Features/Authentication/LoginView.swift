//
//  LoginView.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                
                Spacer()
                    .frame(height: 60)
                
                CustomTextField(text: $id, textfieldTitle: "아이디", prompt: "아이디를 입력해주세요")
                
                Spacer()
                    .frame(height: 22)
                
                CustomSecureField(password: $password, secureFieldTitle: "비밀번호", prompt: "비밀번호를 입력해주세요")
                
                Spacer()
                    .frame(height: 50)
                
                CustomButton(isDisable: .constant(id.isEmpty || password.isEmpty), label: "로그인", labelColor: .white) {
                }
                
                Spacer()
                    .frame(height: 37)
                
                Spacer()

                HStack {
                    NavigationLink {
                        
                    } label: {
                        Text("아이디 찾기")
                            .foregroundStyle(.gray)
                            .font(.semibold14)
                    }
                    Rectangle()
                        .frame(width: 2, height: 14)
                        .foregroundStyle(.gray)
                    
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("회원가입")
                            .font(.semibold14)
                            .foregroundStyle(.mint.opacity(0.6))
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
