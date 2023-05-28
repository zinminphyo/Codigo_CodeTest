//
//  NetworkError.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation


enum NetworkError {
    case unauthorized
    case notFound
    case internalServerError
    case customError(String)
}


extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "Unauthorized"
        case .notFound:
            return "Not Found"
        case .internalServerError:
            return "Internal Server Error"
        case let .customError(error):
            return error
        }
    }
}
