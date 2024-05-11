//
//  Coin.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import Foundation

struct Coin: Codable, Identifiable {
    let id = UUID()
    let assetId : String
    let url : String
    
    enum CodingKeys: String,CodingKey{
        case assetId = "asset_id"
        case url
        case id
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        assetId = try values.decode(String.self, forKey: .assetId)
        url = try values.decode(String.self, forKey: .url)
    }
    
    init(assetId:String,url:String) {
        self.assetId = assetId
        self.url = url
    }
}
