//
//  PostDetail.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//Modelo para el detalle de los posts
import Foundation

struct PostDetail: Decodable, Identifiable{
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
