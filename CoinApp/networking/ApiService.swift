//
//  ApiService.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import Foundation

struct ApiService : ApiServiceProtocol{
    
    func fetchCoins(url: URL?, completion: @escaping(Result<[Coin],ApiError>) -> Void){
        guard let url  = url else {
            let error = ApiError.badURL
            completion(Result.failure(error))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("47A14571-43EF-4C5B-B113-05735CAECBD1", forHTTPHeaderField: "X-CoinAPI-Key")
        let task = URLSession.shared.dataTask(with: request){(data,response,error) in
            if let error = error as? URLError{
                completion(Result.failure(ApiError.url(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode){
                print(ApiError.badResponse(statusCode: response.statusCode))
                completion(Result.failure(ApiError.badResponse(statusCode: response.statusCode)))
            }else if let data = data{
                let decoder = JSONDecoder()
                do {
                    let coins = try decoder.decode([Coin].self, from: data)
                    completion(Result.success(coins))
                }catch{
                    completion(Result.failure(ApiError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
