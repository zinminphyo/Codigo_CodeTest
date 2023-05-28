//
//  MovieLists.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class MovieLists: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var movieListsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
        configureCategoryCollectionView()
        configureTableView()
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "What are you looking for?"
        titleLabel.font = Fonts.bold
        titleLabel.textColor = UIColor.black
    }
    
    private func configureCategoryCollectionView() {
        categoryCollectionView.register(UINib(nibName: String(describing: MovieCollectionViewCell.reuseIdentifier), bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        categoryCollectionView.dataSource = self
        categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: 200, height: 50)
        flowLayout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = flowLayout
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureTableView() {
        movieListsTableView.register(UINib(nibName: String(describing: PopularMovieTableViewCell.self), bundle: nil), forCellReuseIdentifier: PopularMovieTableViewCell.reuseIdentifier)
        movieListsTableView.register(UINib(nibName: String(describing: UpcomingMovieTableViewCell.self), bundle: nil), forCellReuseIdentifier: UpcomingMovieTableViewCell.reuseIdentifier)
        movieListsTableView.separatorStyle = .none
        movieListsTableView.dataSource = self
        movieListsTableView.delegate = self
    }

}

// MARK: - UICOllectionViewDataSource.
extension MovieLists: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}



// MARK: - UITableView Data Source.
extension MovieLists: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.reuseIdentifier, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingMovieTableViewCell.reuseIdentifier, for: indexPath) as? UpcomingMovieTableViewCell else { return UITableViewCell() }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = MovieDetailsModule.createModule() else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
