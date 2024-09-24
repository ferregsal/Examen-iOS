//
//  MoviesProvider.swift
//  Examen-iOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class MovieProvider {
    
    static func findMoviesByName(_ name: String, withResult: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)s=\(name)") else {
            print("URL not valid")
            return
        }
        if name != "" {
            
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                // Process the data
                let result = try! JSONDecoder().decode(Movies.self, from: data)
                withResult(result.Search)
            }
        }
            
        task.resume()
        }
    }
    static func findMoviesById(_ id: String, withResult: @escaping (Movie?) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)i=\(id)") else {
            print("URL not valid")
            return
        }
        if id != "" {
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                // Process the data
                let result = try! JSONDecoder().decode(Movie.self, from: data)
                withResult(result)
            }
        }
            
        task.resume()
        }
    }
    
}
