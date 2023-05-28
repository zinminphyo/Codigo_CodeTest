//
//  CreateAccount.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import UIKit
import Combine

class CreateAccount: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var createAccountNowBtn: UIButton!
    
    var viewModel: CreateAccountViewModel! = nil
    
    private var cancellable =  Set<AnyCancellable>()
    private var formLists: [FormType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureTableView()
        configureCreateAccountNowBtn()
        configureViewModel()
    }
    
    private func configureTableView() {
        tableView.register(UINib(nibName: String(describing: FormTableViewCell.self), bundle: nil), forCellReuseIdentifier: FormTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: String(describing: DOBTableViewCell.self), bundle: nil), forCellReuseIdentifier: DOBTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.keyboardDismissMode = .onDrag
    }
    
    private func configureCreateAccountNowBtn() {
        createAccountNowBtn.setGradientBackground(startColor: Colors.startColor, endColor: Colors.endColor)
        createAccountNowBtn.layer.cornerRadius = 10
        createAccountNowBtn.clipsToBounds = true
    }
    
    private func configureViewModel() {
        viewModel.formLists
            .sink(receiveValue: { [weak self] formLists in
                guard let self = self else { return }
                self.formLists = formLists
                self.tableView.reloadData()
                self.tableViewHeightConstraint.constant = CGFloat(formLists.count * 60)
            })
            .store(in: &cancellable)
        
        viewModel.formIsCompleted
            .sink(receiveValue: { [weak self] isCompleted in
                guard let self = self else { return }
                self.createAccountNowBtn.alpha = isCompleted ? 1.0 : 0.4
                self.createAccountNowBtn.isUserInteractionEnabled = isCompleted
            })
            .store(in: &cancellable)
        
        viewModel.viewDidLoad()
    }
    
    
}

// MARK: - Actions
extension CreateAccount {
    @objc func didTapCreateAccountBtn() {
        print("Create Account Tapped.")
    }
}

// MARK: - UITableView Data Source.
extension CreateAccount: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if formLists[indexPath.row] == .dob {
            guard let dobCell = tableView.dequeueReusableCell(withIdentifier: DOBTableViewCell.reuseIdentifier, for: indexPath) as? DOBTableViewCell else { return UITableViewCell() }
            return dobCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.reuseIdentifier, for: indexPath) as? FormTableViewCell else { return UITableViewCell() }
            cell.updateUI(title: formLists[indexPath.row].title)
            cell.isEmptyFlag.sink { [weak self] flag in
                guard let self  = self else { return }
                self.viewModel.set(flag: !flag, for: self.formLists[indexPath.row])
            }.store(in: &cancellable)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
