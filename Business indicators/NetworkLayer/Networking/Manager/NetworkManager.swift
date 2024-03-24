//
//  NetworkManager.swift
//  Business indicators
//
//  Created by Роман Вертячих on 15.03.2024.
//

import Foundation

struct NetworkManager {
    
    //MARK: - Properties
    
    static let environment: NetworkEnvironment = .production
//    static let APIKey = "YOUR_API_KEY"
    
    //MARK: - Private properties
    
    private let router = Router<FactsApi>() ///TEST_NetworkLayer
    
    //MARK: - Function
    
    #warning("TEST_NetworkLayer")
    func getFactsAboutCats(page: Int, completion: @escaping (_ facts: [Fact]?,_ error: String?) -> ()){
        router.request(.facts(page: page)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = handleNetworkResponse(response)
                switch result {
                case .succes:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
//                        print(String(data: responseData, encoding: .utf8))
                        let apiResponse = try JSONDecoder().decode(FactsAboutCatsApiResponse.self, from: responseData)
                        completion(apiResponse.values, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFalureError):
                    completion(nil, networkFalureError)
                }
            }
        }
    }
    
    //MARK: Private function
        
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
            case 200...299: return .succes
            case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
            case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
            case 600: return .failure(NetworkResponse.outdated.rawValue)
            default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
        
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request."
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could note decode the response."
}
    
enum Result<String> {
    case succes
    case failure(String)
}

//MARK: Пример описания всех состояний ответа от сервера

//private func handleResponse<T: Decodable>(httpResponse: HTTPURLResponse, request: URLRequest, data: Data?, completion: @escaping (Result<T, NetworkError>) -> Void) {
//    switch httpResponse.statusCode {
//    case 200...299: // Success
//        guard let data = data else {
//            completion(.failure(.dataNotFound))
//            return
//        }
//        
//        decodeData(data, completion: completion)
//        
//    case 400:
//        let errorMessage = decodeErrorMessage(from: data)
//        completion(.failure(.badRequest(errorMessage)))
//    case 401:
//        refreshToken { [weak self] result in
//            switch result {
//            case .success:
//                // Повторяем запрос после успешного обновления токена и засовываем новый токен в хедер
//                var updatedRequest = request
//                self?.applyHeaders(nil, to: &updatedRequest)
//                self?.processRequest(request: updatedRequest, completion: completion)
//            case .failure:
//                let errorMessage = self?.decodeErrorMessage(from: data)
//                completion(.failure(.unauthorized(errorMessage)))
//            }
//        }
//    case 403:
//        let errorMessage = decodeErrorMessage(from: data)
//        completion(.failure(.forbidden(errorMessage)))
//    case 404:
//        let errorMessage = decodeErrorMessage(from: data)
//        completion(.failure(.notFound(errorMessage)))
//    case 500:
//        let errorMessage = decodeErrorMessage(from: data)
//        completion(.failure(.internalServerError(errorMessage)))
//    default:
//        let errorMessage = decodeErrorMessage(from: data)
//        completion(.failure(.unknownError(statusCode: httpResponse.statusCode, message: errorMessage?.message)))
//    }
//}
