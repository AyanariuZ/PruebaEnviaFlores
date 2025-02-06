//
//  PostService.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//Servicio donde se hacen las llamadas a la API

import Foundation

class PostService {
    private let urlString = "https://jsonplaceholder.typicode.com/posts"
    private let urlDetailsString = "https://jsonplaceholder.typicode.com/posts/"
    
    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: urlString) else {
            throw PostError.requestError(description: "Bad URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else{
            throw PostError.requestError(description: "Bad response")
        }
        
        guard response.statusCode == 200 else {
            throw PostError.badStatusCode(code: response.statusCode)
        }
        
        do{
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return posts
        }
        catch{
            throw PostError.unknownError(error: error)
        }
        
    }
    
    func fetchPostDetails(id:String) async throws -> PostDetail {
        guard let url = URL(string: urlDetailsString+id) else {
            throw PostError.requestError(description: "Bad URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else{
            throw PostError.requestError(description: "Bad response")
        }
        
        guard response.statusCode == 200 else {
            throw PostError.badStatusCode(code: response.statusCode)
        }
        
        do{
            let details = try JSONDecoder().decode(PostDetail.self, from: data)
            return details
        }
        catch{
            throw PostError.unknownError(error: error)
        }
        
    }
}
