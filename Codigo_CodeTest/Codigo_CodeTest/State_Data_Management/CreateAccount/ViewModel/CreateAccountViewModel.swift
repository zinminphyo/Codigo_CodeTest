//
//  CreateAccountViewModel.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import Combine

class CreateAccountViewModel {
    var formLists: PassthroughSubject<[FormType], Never> = .init()
    var formIsCompleted: CurrentValueSubject<Bool, Never> = .init(false)

    var firstNameCompletedFlag: CurrentValueSubject<Bool, Never> = .init(false)
    var lastNameCompletedFlag: CurrentValueSubject<Bool, Never> = .init(false)
    var emailCompletedFlag: CurrentValueSubject<Bool, Never> = .init(false)
    
    private var cancellable = Set<AnyCancellable>()
    
    func viewDidLoad() {
        formLists.send(FormType.allCases)
        
        
        firstNameCompletedFlag
            .sink { [weak self] flag in
                guard let self  = self else { return }
                self.formIsCompleted.send(flag && self.lastNameCompletedFlag.value && self.emailCompletedFlag.value)
            }
            .store(in: &cancellable)
        
        lastNameCompletedFlag
            .sink { [weak self] flag in
                guard let self = self else { return }
                self.formIsCompleted.send(self.firstNameCompletedFlag.value && flag && self.emailCompletedFlag.value)
            }
            .store(in: &cancellable)
        
        emailCompletedFlag
            .sink { [weak self] flag in
                guard let self = self else { return }
                self.formIsCompleted.send(self.firstNameCompletedFlag.value && self.lastNameCompletedFlag.value && flag)
            }
            .store(in: &cancellable)
    }
    
    func set(flag: Bool, for formType: FormType) {
        switch formType {
        case .firstName:
            self.firstNameCompletedFlag.value = flag
        case .lastName:
            self.lastNameCompletedFlag.value = flag
        case .emailAddress:
            self.emailCompletedFlag.value = flag
        case .dob:
            break
        case .nationality:
            break
        case .country:
            break
        case .mobilePhone:
            break
        }
    }
}

enum FormType: CaseIterable {
    case firstName
    case lastName
    case emailAddress
    case dob
    case nationality
    case country
    case mobilePhone
    
    
    var isOptional: Bool {
        switch self {
        case .mobilePhone:
            return true
        default:
            return false
        }
    }
    
    
    var title: String {
        switch self {
        case .firstName:
            return "First Name *"
        case .lastName:
            return "Last Name *"
        case .emailAddress:
            return "Email Address *"
        case .dob:
            return "Date Of Birth *"
        case .nationality:
            return "Nationality *"
        case .country:
            return "Country of Residence *"
        case .mobilePhone:
            return "Mobile no.(Optional)"
        }
    }
}
