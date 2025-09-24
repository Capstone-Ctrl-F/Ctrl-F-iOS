//
//  SidebarView.swift
//  SettleSupport
//
//  Created by mandoo on 9/23/25.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 20)
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SidebarView()
}
