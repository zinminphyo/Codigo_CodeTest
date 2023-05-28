//
//  PopularMovieCollectionViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class PopularMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var popularPercentageLabel: UILabel!
    
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureContent()
        configureImageView()
        configureNameLabele()
        configureFavouriteButton()
        configurePopularPercentageBtn()
    }
    
    private func configureContent() {
        self.backgroundColor = UIColor.white
    }
    
    private func configureImageView() {
        imageView.image = UIImage(named: "frozen")
        imageView.contentMode = .scaleAspectFill
    }
    
    private func configureNameLabele() {
        movieNameLabel.text = "Frozen 2"
        movieNameLabel.textColor = UIColor.black
    }
    
    private func configureFavouriteButton() {
        favouriteButton.addTarget(self, action: #selector(didTapFavouriteBtn), for: .touchUpInside)
    }
    
    private func configurePopularPercentageBtn() {
        popularPercentageLabel.text = "89 %"
    }
    
    @objc func didTapFavouriteBtn() {
        
    }
    
    func renderUI(movie: Movie) {
        imageView.kf.setImage(with: URL(string: movie.posterFullPath))
        movieNameLabel.text = movie.title
        popularPercentageLabel.text = String(movie.popularity)
    }
}
