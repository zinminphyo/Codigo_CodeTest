//
//  FormTableViewCell.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit
import Combine

class FormTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTxtFiel: UITextField!
    @IBOutlet weak var underlineView: UIView!
    
    var isEmptyFlag: CurrentValueSubject<Bool, Never> = .init(true)
    
    private var cancellable = Set<AnyCancellable>()

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
        configureInputTextField()
        configureCombine()
    }
    
    private func configureInputTextField() {
        inputTxtFiel.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
    }
    
    private func configureCombine() {
        isEmptyFlag
            .sink { [weak self] flag in
                guard let self = self else { return }
                self.underlineView.backgroundColor = flag ? UIColor.red : UIColor.opaqueSeparator
            }
            .store(in: &cancellable)
    }
    
    func updateUI(title: String) {
        titleLabel.text = title
    }
    
    
    @objc func didChangeText() {
        isEmptyFlag
            .send(inputTxtFiel.text?.isEmpty ?? false)
        
        
    }
}



