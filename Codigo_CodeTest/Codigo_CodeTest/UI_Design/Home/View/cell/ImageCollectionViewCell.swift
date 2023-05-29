//
//  ImageCollectionViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import UIKit


class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureImageView()
    }
    
    private func configureImageView() {
        imageView.contentMode = .scaleAspectFill
        
    }

}
