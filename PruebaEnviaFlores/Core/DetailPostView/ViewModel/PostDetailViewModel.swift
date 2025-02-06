//
//  PostDetailViewModel.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//ViewModel de los detalles del post
import Foundation

class PostDetailViewModel: ObservableObject {
    @Published var errorMessage: String?
    private let postId: String
    @Published var details = PostDetail(id: 0, userId: 0, title: "", body: "")
    let service = PostService()
    
    init(postId: String) {
        self.postId = postId
        Task {
            await fetchPostDetails(id: postId)
        }
    }
    
    
    @MainActor
    func fetchPostDetails(id:String) async{
        do {
            self.details = try await service.fetchPostDetails(id: postId)
        }
        catch{
            guard let error = error as? PostError else{
                self.errorMessage = error.localizedDescription
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            self.errorMessage = error.customDescription
        }
    }
    
}
