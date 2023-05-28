//
//  NetworkService.swift
//  Codigo_CodeTest
//
//  Created by Zin Min Phyo on 28/05/2023.
//

import Foundation
import Alamofire

class NetworkService {
    private init() {}
    
    static let shared = NetworkService()
    
    func request<T:Decodable>(router: ApiRouter, onCompletion: @escaping (Result<T, NetworkError>) -> ()) {
        do {
            let request = try router.asURL()
            AF.request(request, method: router.httpMethod, parameters: router.params, encoding: router.encoding, headers: router.header)
                .responseDecodable { (response: DataResponse<T, AFError>) in
                    print("Response is \(response.result)")
                    switch response.result {
                    case let .success(success):
                        onCompletion(.success(success))
                    case let .failure(error):
                        switch response.response?.statusCode {
                        case 401:
                            onCompletion(.failure(.unauthorized))
                        case 404:
                            onCompletion(.failure(.notFound))
                        case 500:
                            onCompletion(.failure(.internalServerError))
                        default:
                            onCompletion(.failure(.customError(error.localizedDescription)))
                        }
                    }
                }
                .cURLDescription { cURL in
                    print("cURL is \(cURL)")
                }
        } catch {
            onCompletion(.failure(.customError("URL Request Error.")))
        }
        
    }
}
