//
//  FormTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTxtFiel: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    func updateUI(title: String) {
        titleLabel.text = title
    }
    
}
