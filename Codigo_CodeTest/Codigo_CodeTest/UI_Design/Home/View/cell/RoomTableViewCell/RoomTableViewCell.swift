//
//  RoomTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 29/05/2023.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewRatesButton: UIButton!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

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
        configureViewRatesButton()
    }
    
    private func configureViewRatesButton() {
        viewRatesButton.layer.borderColor = UIColor.systemOrange.cgColor
        viewRatesButton.layer.borderWidth = 1.0
    }
}
