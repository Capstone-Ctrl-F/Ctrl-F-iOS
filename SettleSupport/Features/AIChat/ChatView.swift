import SwiftUI

struct ChatView: View {
    @State private var inputText: String = ""
    @State private var showSidebar: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 15) {
                            TextField("무엇이든 입력하세요", text: $inputText, axis: .vertical)
                                .padding(.horizontal)
                                .padding(.vertical, 9)
                                .background(.gray.opacity(0.1))
                                .cornerRadius(15)
                            
                            Image(systemName: "arrow.up")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.black)
                                .clipShape(Circle())
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
                
                if showSidebar {
                    
                }
            }
            .navigationBarTitle("채팅", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            showSidebar.toggle()
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ChatView()
}

