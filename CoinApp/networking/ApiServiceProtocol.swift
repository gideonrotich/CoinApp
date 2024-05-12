//
//  ApiServiceProtocol.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import Foundation

protocol ApiServiceProtocol{
    func fetchCoins(url: URL?, completion: @escaping(Result<[Coin],ApiError>) -> Void)
}
