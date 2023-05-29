//
//  RateTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var viewRatesButton: UIButton!
    

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureContent()
    }
    
    private func configureHierarchy() {
//        configureContent()
        configureViewRatesButton()
    }
    
    private func configureViewRatesButton() {
        viewRatesButton.layer.borderColor = UIColor.systemOrange.cgColor
        viewRatesButton.layer.borderWidth = 1.0
    }
    
    private func configureContent() {
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = UIColor.black.cgColor
        yourViewBorder.lineDashPattern = [2, 2]
        yourViewBorder.frame = self.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
        self.layer.addSublayer(yourViewBorder)
        
        self.backgroundColor = UIColor.white
    }
    
}
