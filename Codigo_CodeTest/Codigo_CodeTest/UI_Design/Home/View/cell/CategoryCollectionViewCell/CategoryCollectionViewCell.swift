//
//  CategoryCollectionViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureCategoryNameLabel()
        configureCategoryNameLabel()
    }
    
    private func configureCategoryImageView() {
        
    }
    
    private func configureCategoryNameLabel() {
        
    }
    
    func renderUI(image: UIImage?, name: String) {
        categoryImageView.image = image
        categoryNameLabel.text = name
    }

}
