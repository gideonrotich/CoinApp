//
//  CoinsFetcher.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import Foundation


class CoinsFetcher: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service : ApiServiceProtocol
    
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
        fetchAllCoins()
    }
    
    func fetchAllCoins(){
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/100")
        service.fetchCoins(url: url){[unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let coins):
                    self.coins = coins
                }
            }
        }
    }
}
