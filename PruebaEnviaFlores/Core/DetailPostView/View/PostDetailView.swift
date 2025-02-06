//
//  PostDetailView.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//Vista del detalle del post
import SwiftUI

struct PostDetailView: View {
    let post: Post
    @ObservedObject var viewModel: PostDetailViewModel
    
    init(post: Post) {
        self.post = post
        self.viewModel = PostDetailViewModel(postId: "\(post.id)")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack(spacing: 12){
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32)
                
                Text("User \(viewModel.details.userId)")
                    .font(.title3)
            }
            Text(viewModel.details.title)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(viewModel.details.body)
                .font(.callout)
            
            Spacer()
        }
        .padding()
        .overlay {
            if let error = viewModel.errorMessage {
                Text(error)
                    .frame(maxWidth: .infinity)
                    
            }
        }
        
    }
}

#Preview {
    PostDetailView(post: Post(id: 1, userId: 1, title: "titulo", body: "cuerpo"))
}


