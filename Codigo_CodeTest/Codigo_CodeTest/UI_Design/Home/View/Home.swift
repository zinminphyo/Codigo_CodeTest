//
//  Home.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

enum ListStyle {
    case byRoom
    case byRate
}

class Home: UIViewController {
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var listsStateControl: UISegmentedControl!
    
    private var listStyle: ListStyle = .byRoom

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureFirstCollectionView()
        configureSecondCollectionView()
        configureTableView()
        configureSegmentedControl()
    }
    
    private func configureFirstCollectionView() {
        firstCollectionView.register(UINib(nibName: String(describing: ImageCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        firstCollectionView.dataSource = self
        firstCollectionView.isPagingEnabled = true
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 200, height: firstCollectionView.frame.height)
        firstCollectionView.showsVerticalScrollIndicator = false
        firstCollectionView.showsHorizontalScrollIndicator = false
        firstCollectionView.collectionViewLayout = flowLayout
    }
    
    private func configureSecondCollectionView() {
        secondCollectionView.register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        secondCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.estimatedItemSize = CGSize(width: secondCollectionView.frame.height, height: secondCollectionView.frame.height)
        secondCollectionView.showsHorizontalScrollIndicator = false
        secondCollectionView.showsVerticalScrollIndicator = false
        secondCollectionView.collectionViewLayout = flowLayout
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: RoomTableViewCell.self), bundle: nil), forCellReuseIdentifier: RoomTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: String(describing: RateTableViewCell.self), bundle: nil), forCellReuseIdentifier: RateTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
    
    private func configureSegmentedControl() {
        listsStateControl.addTarget(self, action: #selector(didChangeState), for: .valueChanged)
    }
    
    @objc func didChangeState() {
        switch listsStateControl.selectedSegmentIndex {
        case 0:
            listStyle = .byRoom
        case 1:
            listStyle = .byRate
        default:
            break
        }
        tableView.reloadData()
    }

}


extension Home: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == firstCollectionView ? 5 : 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
        
    }
}



extension Home: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if listStyle == .byRoom {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomTableViewCell.reuseIdentifier, for: indexPath) as? RoomTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RateTableViewCell.reuseIdentifier, for: indexPath) as? RateTableViewCell else { return UITableViewCell() }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return listStyle == .byRoom ? 260 : 250
    }
}
