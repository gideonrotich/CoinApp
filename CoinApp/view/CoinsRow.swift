//
//  CoinsRow.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import SwiftUI

struct CoinsRow: View {
    let coin: Coin
    let imageSize: CGFloat = 100
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(coin.assetId)
                .font(.headline)
        
        }    }
}
