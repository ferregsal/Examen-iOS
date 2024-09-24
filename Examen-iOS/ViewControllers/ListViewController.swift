//
//  ViewController.swift
//  Examen-iOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit


class ListViewController: UIViewController, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
        
        let movie = movieList[indexPath.row]
        
        cell.render( movie : movie)
        
        return cell
    }
    
    
    @IBOutlet weak var movieTableView: UITableView!
    var movieList: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup SearchBar
              let search = UISearchController(searchResultsController: nil)
              search.delegate = self
              search.searchBar.delegate = self
              self.navigationItem.searchController = search
              
        //Setup TableView
            movieTableView.dataSource = self
        
    }

    func searchMovies(_ query: String) {
        MovieProvider.findMoviesByName(query, withResult: { [unowned self] movies in
               self.movieList = movies
               DispatchQueue.main.async {
                   self.movieTableView.reloadData()
                    }
                })
            
            }
    

    // MARK: SearchBar Delegate
      func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          searchMovies(searchBar.text!)
      }
      
      func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          searchMovies("Batman")
      }
      
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if (searchText.isEmpty) {
              searchMovies("Batman")
          }
      }
    // MARK: Navegación
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let viewController = segue.destination as! DetailViewController
            
            // Obtener el índice de la fila seleccionada
            if let indexPath = movieTableView.indexPathForSelectedRow {
                // Obtener la película seleccionada para su imdbID
                let selectedMovie = movieList[indexPath.row]
                let movieId = selectedMovie.imdbID
                
                // Llamar a la función que buscará la película por ID
                MovieProvider.findMoviesById(movieId) { [weak viewController] movieDetails in
                    DispatchQueue.main.async {
                        // Aquí, movieDetails es de tipo Movie?
                        if let movieDetails = movieDetails { // Asegúrate de que sea opcional
                            // Asignar los detalles de la película al controlador de detalles
                            viewController?.movie = movieDetails
                            viewController?.updateUI()  // Asegúrate de tener una función para actualizar la UI
                        } else {
                            // Manejar el caso de error o película no encontrada
                            print("No se encontraron detalles para la película con ID: \(movieId)")
                        }
                    }
                }
            }
        }
    }
       
        }


