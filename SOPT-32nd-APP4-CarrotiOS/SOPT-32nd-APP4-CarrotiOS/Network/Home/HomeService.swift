//
//  HomeService.swift
//  SOPT-32nd-APP4-CarrotiOS
//
//  Created by kyun on 2023/05/26.
//

import Foundation

import Alamofire

final class HomeService {
    
    static let get = HomeService()
    
    private init() {}
    
    func loadSales(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config.baseURL + "/sale"
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400, 409:
            return isValidData(data: data)
        case 500:
            return .serverErr
        default:
            return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(HomeDataModel.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
