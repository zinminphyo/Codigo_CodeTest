//
//  PopularMovieTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    private var movieLists: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureHierarchy() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: String(describing: PopularMovieCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: PopularMovieCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        print("Collection View Frame is \(collectionView.frame)")
        flowLayout.itemSize = CGSize(width: collectionView.frame.width / 2 - 10, height: 250)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func updateUI(lists: [Movie]) {
        self.movieLists = lists
    }
    
}

extension PopularMovieTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.reuseIdentifier, for: indexPath) as? PopularMovieCollectionViewCell else { return UICollectionViewCell() }
        cell.renderUI(movie: movieLists[indexPath.row])
        return cell
    }
}
