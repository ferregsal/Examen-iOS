//
//  MovieViewCell.swift
//  Examen-iOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation
import UIKit
class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    func render(movie: Movie) {
       titleLabel.text = movie.Title
       posterImageView.loadFrom(url: movie.Poster)
        yearLabel.text = movie.Year
    }

   /* override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
