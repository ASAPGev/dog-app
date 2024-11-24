//
//  ProileView.swift
//  Dog
//
//  Created by Мадина Валиева on 22.10.2024.
//

import SwiftUI

struct ProileView: View {
    
    @State private var avatar: UIImage?

    var body: some View {
        VStack() {
            avatarView
            Text("")
            Spacer()
            Text("Border collie")
        }
    }
    
    private var avatarView: some View {
        Group {
            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { phase in
                switch phase {
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                default:
                    ProgressView()
                }
            }
            .frame(width: 70, height: 70)
            .clipShape(.rect(cornerRadius: 70))
        }
    }
}

#Preview {
    ProileView()
}
