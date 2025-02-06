//
//  PostViewModel.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//ViewModel para la vista principal
import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    
    let service = PostService()
    
    init() {
        Task {
            await fetchPosts()
        }
    }
    
    
    @MainActor
    func fetchPosts() async{
        do {
            self.posts = try await service.fetchPosts()
        }
        catch{
            guard let error = error as? PostError else{
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.errorMessage = error.customDescription
        }
    }
    
}
