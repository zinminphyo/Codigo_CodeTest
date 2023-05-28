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
    
    func viewDidLoad() {
        formLists.send(FormType.allCases)
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
