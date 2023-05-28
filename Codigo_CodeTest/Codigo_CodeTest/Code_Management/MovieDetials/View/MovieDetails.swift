//
//  MovieDetials.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit
import Combine

class MovieDetails: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var movieDetailsImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviefavouriteCountLabel: UILabel!
    @IBOutlet weak var movieReleasedDateLabel: UILabel!
    @IBOutlet weak var movieVoteCountLabel: UILabel!
    @IBOutlet weak var movieCategoryLabel: UILabel!
    @IBOutlet weak var movieLanguageLabel: UILabel!
    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var casterCollectionView: UICollectionView!
    @IBOutlet weak var viewAllButton: UIButton!
    @IBOutlet weak var seperatorView: UIView!
    
    var viewModel: MovieDetailsViewModel? = nil
    
    private var cancellable = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackButton()
        configureCasterCollectionView()
        configureViewAllButton()
        configureSeperatorView()
        configureViewModel()
    }
    
    private func configureBackButton() {
        backButton.addTarget(self, action: #selector(didTapBackBtn), for: .touchUpInside)
    }
    
    private func configureCasterCollectionView() {
        casterCollectionView.register(UINib(nibName: String(describing: CasterCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CasterCollectionViewCell.reuseIdentifier)
        casterCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 130, height: 150)
        flowLayout.scrollDirection = .horizontal
        casterCollectionView.collectionViewLayout = flowLayout
        casterCollectionView.showsVerticalScrollIndicator = false
        casterCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureViewAllButton() {
        viewAllButton.addTarget(self, action: #selector(didTapViewAllBtn), for: .touchUpInside)
    }
    
    private func configureSeperatorView() {
        seperatorView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        seperatorView.layer.cornerRadius = 25
    }
    
    private func configureViewModel() {
        viewModel?.fetchMovieDetails()
        
        viewModel?.movieDetails
            .sink(receiveCompletion: { error in
                print("Error is \(String(describing: error))")
            }, receiveValue: { [weak self] dettils in
                guard let self = self else { return }
                self.movieDetailsImageView.kf.setImage(with: URL(string: dettils.posterFullPath))
                self.movieNameLabel.text = dettils.originalTitle
                self.moviefavouriteCountLabel.text = String(dettils.voteAverage) + " %"
                self.movieReleasedDateLabel.text = dettils.releaseDate
                self.movieDescLabel.text = dettils.overview
            })
            .store(in: &cancellable)
    }

}


extension MovieDetails: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CasterCollectionViewCell.reuseIdentifier, for: indexPath) as?  CasterCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}

extension MovieDetails {
    @objc func didTapBackBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapViewAllBtn() {
        print("Tapped View All Button.")
    }
}
