//
//  UpcomingMovieTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class UpcomingMovieTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureImageView()
        configureTitleLable()
        configureDescLabel()
    }
    
    private func configureImageView() {
        movieImageView.image = UIImage(named: "frozen")
        movieImageView.contentMode = .scaleAspectFill
    }
    
    private func configureTitleLable() {
        movieNameLabel.text = "spies in Disguise"
        movieNameLabel.textColor = UIColor.black
        movieNameLabel.numberOfLines = 1
    }
    
    private func configureDescLabel() {
        movieDescLabel.text = "sdkjghsdjgjnsdjgjsdjgnjsndgjnsdngksndgnlksdglkslkdngnsdlkgnlksdnglknsdngsndgnsdnglsdkjghsdjgjnsdjgjsdjgnjsndgjnsdngksndgnlksdglkslkdngnsdlkgnlksdnglknsdngsndgnsdngl"
        movieDescLabel.textColor = UIColor.secondaryLabel
        movieDescLabel.numberOfLines = 0
    }
    
    private func configureLikeButton() {
        likeBtn.addTarget(self, action: #selector(didTapLikeBtn), for: .touchUpInside)
    }
    
    @objc func didTapLikeBtn() {
        print("Tapped Like Button.")
    }
}
