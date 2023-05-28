//
//  DOBTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit

class DOBTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var inputDateTextField: UITextField!
    @IBOutlet weak var genderSwitchControl: UIControl!


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
        configureDateTextField()
        configureSwitchControl()
    }
    
    private func configureDateTextField() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        inputDateTextField.inputView = datePicker
        inputDateTextField.tintColor = UIColor.white
    }
    
    private func configureSwitchControl() {
        
    }
    
}
