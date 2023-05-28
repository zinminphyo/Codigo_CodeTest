//
//  MovieListsModule.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import UIKit


enum MovieListsModule {
    static func createModule() -> MovieLists? {
        let st = UIStoryboard(name: "MovieLists", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: MovieLists.self)) as? MovieLists else { return nil }
        return vc
    }
}
