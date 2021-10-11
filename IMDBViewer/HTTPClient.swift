//
//  HTTPClient.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import Alamofire
import Foundation

enum HTTPErrors: Error {
    case parsingError
}

class HTTPClient {

    static let apiV3AuthKey = "39fb7fcc62efd1f37b4ba6fd2a8e2771"
    static var parameters: [String: Any] = [
        "api_key": HTTPClient.apiV3AuthKey,
        "language": "en-US",
        "region": "US"
    ]

    func get<T: Decodable>(url: String,
                           parameters: [String: Any]?,
						   completionHandler: @escaping(Swift.Result<T, HTTPErrors>) -> Void) {

        if let parameters = parameters {
            for key in parameters.keys {
                HTTPClient.parameters[key] = parameters[key]
            }
        }

		Alamofire.request(url, method: .get, parameters: HTTPClient.parameters).validate().responseData { data in
            switch data.result {
            case .success(let responseData):
                do {
                    let jsonDecoder = JSONDecoder()
                    let decodedResponseData = try jsonDecoder.decode(T.self, from: responseData)
                    completionHandler(.success(decodedResponseData))
                } catch (let decodeError) {
                    print(decodeError)
                    completionHandler(.failure(.parsingError))
                }
            case .failure:
                completionHandler(.failure(.parsingError))
            }
        }
    }
}
