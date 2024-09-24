//
//  Movie.swift
//  Examen-iOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

struct Movies : Codable {
    let Search : [Movie]
    
}
struct Movie : Codable {
    let Title : String
    let Genre : String?
    let imdbID : String
    let Year : String
    let Poster : String
    let Director : String?
    let Plot : String?
    let Country : String?
    let Duration: String?
    
}
