//
//  DetailViewController.swift
//  Examen-iOS
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    var movie: Movie? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie.Title
            genreLabel.text = movie.Genre
            yearLabel.text = movie.Year
            directorLabel.text = movie.Director
            countryLabel.text = movie.Country
            plotLabel.text = movie.Plot
            durationLabel.text = movie.Duration
            posterImageView.loadFrom(url: movie.Poster)
        }
        updateUI()
    }
    func updateUI() {
         // Actualizar la interfaz de usuario con los datos de la película
         titleLabel.text = movie?.Title
         genreLabel.text = movie?.Genre
         directorLabel.text = movie?.Director
         plotLabel.text = movie?.Plot
        yearLabel.text = movie?.Year
        durationLabel.text = movie?.Runtime
        if movie?.Runtime == nil{
            durationLabel.text = "N/A"
        }
        countryLabel.text = movie?.Country
         
         if let posterUrl = movie?.Poster, let url = URL(string: posterUrl) {
             DispatchQueue.global().async {
                 if let data = try? Data(contentsOf: url) {
                     DispatchQueue.main.async {
                         self.posterImageView.image = UIImage(data: data)
                     }
                 }
             }
         }
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
