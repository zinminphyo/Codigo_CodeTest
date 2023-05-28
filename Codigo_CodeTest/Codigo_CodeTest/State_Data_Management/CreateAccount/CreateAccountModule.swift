//
//  CreateAccountModule.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import UIKit


enum CreateAccountModule {
    static func createModule() -> CreateAccount? {
        let st = UIStoryboard(name: "CreateAccount", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: CreateAccount.self)) as? CreateAccount else { return nil }
        vc.viewModel = CreateAccountViewModel()
        return vc
    }
}
