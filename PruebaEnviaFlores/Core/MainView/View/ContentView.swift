//
//  ContentView.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//Vista principal con la lista de posts

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    var body: some View {
        NavigationStack {
            List{
                ForEach(viewModel.posts){ post in
                    NavigationLink(value: post) {
                        HStack(spacing: 12) {
                            Text("\(post.id)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32)
                            
                            VStack(alignment: .leading){
                                Text("User \(post.userId)")
                                    .font(.footnote)
                                
                                Text(post.title)
                                    .font(.headline)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post )
            }
        }
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
