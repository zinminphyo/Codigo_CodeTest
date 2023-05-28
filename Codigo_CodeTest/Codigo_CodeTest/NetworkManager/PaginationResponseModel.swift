//
//  PaginationResponseModel.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation


struct PaginationResponseModel<T:Decodable>: Decodable {
    let results: [T]
    let page: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
}
