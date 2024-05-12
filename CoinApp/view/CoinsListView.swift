//
//  CoinsListView.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import SwiftUI

struct CoinsListView: View {
    let coins : [Coin]
    @State var searchText:String = ""
    
    var filteredCoins:[Coin]{
        if(searchText.count == 0){
            return coins
        }else{
            return coins.filter{
                $0.assetId.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredCoins){coin in
                    CoinsRow(coin: coin)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Explore world coins")
        }
    }
}

