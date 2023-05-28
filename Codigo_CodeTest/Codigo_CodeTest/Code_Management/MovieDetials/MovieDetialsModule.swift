//
//  MovieDetialsModule.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import UIKit


enum MovieDetailsModule {
    static func createModule() -> MovieDetails? {
        let st = UIStoryboard(name: "MovieDetails", bundle: .main)
        guard let vc = st.instantiateViewController(withIdentifier: String(describing: MovieDetails.self)) as? MovieDetails else { return nil }
        return vc
    }
}
