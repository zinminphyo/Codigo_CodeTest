//
//  CasterCollectionViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class CasterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var casterImageView: UIImageView!
    @IBOutlet weak var casterNameLabel: UILabel!
    
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
        configureNameLabel()
    }
    
    private func configureContent() {
        self.backgroundColor = UIColor.white
    }
    
    private func configureImageView() {
        casterImageView.image = UIImage(named: "frozen")
        casterImageView.contentMode = .scaleAspectFill
    }
    
    private func configureNameLabel() {
        casterNameLabel.text = "Idina Menzel"
        casterNameLabel.textColor = UIColor.black
    }

}
