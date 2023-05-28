//
//  MovieCollectionViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var underlineView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureContent()
        configureTitleLabel()
        configureUnderlineView()
    }
    
    private func configureContent() {
        self.backgroundColor = UIColor.white
    }
    
    private func configureTitleLabel() {
        
    }
    
    private func configureUnderlineView() {
        underlineView.layer.cornerRadius = 2
        underlineView.backgroundColor = UIColor.systemBlue
    }

}
