//
//  Model.swift
//  PruebaEnviaFlores
//
//  Created by Rafael Alejandro Rivas González on 06/02/25.
//

//Modelo de datos para el post
import Foundation

struct Post: Codable, Identifiable, Hashable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
