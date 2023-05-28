//
//  MovieLists.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit
import Combine

class MovieLists: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var movieListsTableView: UITableView!
    
    var viewModel: MovieListsViewModel? = nil
    
    
    private var cancellable = Set<AnyCancellable>()
    private var popularMovieLists: [Movie] = []
    private var upcomingMovieLists: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTitleLabel()
        configureCategoryCollectionView()
        configureTableView()
        configureViewModel()
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
        movieListsTableView.showsVerticalScrollIndicator = false
        movieListsTableView.showsHorizontalScrollIndicator = false
        movieListsTableView.dataSource = self
        movieListsTableView.delegate = self
    }
    
    private func configureViewModel() {
        
        viewModel?.popularLists
            .sink(receiveCompletion: { completion in
                print("Error is \(String(describing: completion))")
            }, receiveValue: { [weak self] lists in
                guard let self = self else { return }
                self.popularMovieLists = lists
                self.movieListsTableView.reloadSections([0], with: .fade)
            })
            .store(in: &cancellable)
        
        viewModel?.upcomingLists
            .sink(receiveCompletion: { error in
                print("Error is \(String(describing: error))")
            }, receiveValue: { [weak self] lists in
                guard let self = self else { return }
                self.upcomingMovieLists = lists
                self.movieListsTableView.reloadSections([1], with: .fade)
            })
            .store(in: &cancellable)
        
        viewModel?.fetchPopularMovieLists()
        viewModel?.fetchUpcomingMovieLists()
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
        return section == 0 ? 1 : upcomingMovieLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMovieTableViewCell.reuseIdentifier, for: indexPath) as? PopularMovieTableViewCell else { return UITableViewCell() }
            cell.updateUI(lists: popularMovieLists)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingMovieTableViewCell.reuseIdentifier, for: indexPath) as? UpcomingMovieTableViewCell else { return UITableViewCell() }
            cell.renderUI(movie: upcomingMovieLists[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = MovieDetailsModule.createModule(id: upcomingMovieLists[indexPath.row].id) else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
